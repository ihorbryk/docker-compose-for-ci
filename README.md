# docker-compose-for-ci
Image for gitlab-ci. This image help deploy projects with docker-compose to remote servers

## Why?

Deploy to remote server without copy any files to remote server.

You use docker-compose with `-H` parametr to set remote machine for run containers defined in docker-file.yml.

## How to use?

This docker image is public and located on docker hub. You can use this image as base for `deploy` step in you pipeline.

## Example. 

Part describe deploy to remote server (.gitlab-ci.yml file):

```yml
...

deploy:
  image: ihorbrykm/docker-compose-for-ci:latest
  stage: deploy
  variables:
    IMAGE_TAG: $CI_REGISTRY_IMAGE:$CI_COMMIT_REF_SLUG
  script:
    - echo "$PROD_PK" | ssh-add -
    - ssh-add -l
    - docker-compose -H "ssh://$PROD_USER@$PROD_IP" down --remove-orphans
    - docker-compose -H "ssh://$PROD_USER@$PROD_IP" pull
    - docker-compose -H "ssh://$PROD_USER@$PROD_IP" up -d

...
```
