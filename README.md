[![GitPitch](https://gitpitch.com/assets/badge.svg)](https://gitpitch.com/awesome-inc/docker-deploy-offline/master)

# docker-deploy-offline

How to use docker for (almost) continuous delivery in an offline environment.

## Packaging

Start a local registry, build and push your images

```bash
docker-compose -f docker-compose.registry.yml up -d
docker-compose build
docker-compose push
```

Fire up the registry frontend on [http://localhost:8080](http://localhost:8080) and watch your built images.
Docker images are contained in the docker volume `docker_images`.

## Deployment

TODO:

- Export docker volume with built images `docker_images`,
  cf.: [moby/issues/31417: how can i export an docker volume to a zip or tar file](https://github.com/moby/moby/issues/31417#issuecomment-283033514)
- How to retag images?
