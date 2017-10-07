@title[Introduction]
# (Almost) Continuous Delivery with <span style="color: #e49436">Docker</span>

#### How to use docker for (almost) continuous delivery in an offline environment.*
<br>
<br>
<span style="color: #bbb; font-size: 80%">[ Docker, Compose, Linux, Windows ]</span>

---
@title[PITCHME.md]

#### GitPitch turns <span style="color: #e49436; text-transform: none">PITCHME.md</span> into
#### interactive,
#### online and offline slideshows.
<br>
<span style="color:gray; font-size:0.6em;">[ JUST LIKE THIS ONE ]</span>

---

#### No more <span style="color: gray">"We target Windows, so we can't use Docker."</span>
#### No more <span style="color: gray">"We are on private networks, so no benefit from Docker."</span>
<br>
#### Just <span style="color: #e49436">docker-compose build</span>.
#### Then <span style="color: #e49436">docker-compose push</span>.

------
@title[Step 1. Create 'PITCHME.md']

### <span style="color: #e49436">STEP 1. Create 'PITCHME.md'</span>
<br>

#### Create GitPitch slideshow content using GitHub Flavored Markdown in your favorite editor.

<br>
<span style="color:gray; font-size:0.6em;">[ AS EASY AS README.md ]</span>

------

@title[Step 2. Git-Commit]

### <span style="color: #e49436">STEP 2. GIT-COMMIT</span>
<br>

```shell
$ git add PITCHME.md
$ git commit -m "New slideshow content."
$ git push

Done!

```
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
