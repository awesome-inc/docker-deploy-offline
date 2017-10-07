@title[Introduction]
# Offline <span style="color: #e49436">Docker</span>

#### How to use docker for (almost) continuous delivery in an offline environment.*
<br>
<br>
<span style="color: #bbb; font-size: 80%">[ Docker, Compose, Linux, Windows ]</span>

---

#### No more <span style="color: gray">"We target Windows, so we can't use Docker."</span>
#### No more <span style="color: gray">"We are on private networks, so no benefit from Docker."</span>
<br>
#### Just <span style="color: #e49436">docker-compose build</span>.
#### Then <span style="color: #e49436">docker-compose push</span>.

---

@title[Step 1. Build & Package]

### <span style="color: #e49436">STEP 1. Build & Package</span>
<br>

```shell
docker-compose -f docker-compose.registry.yml up -d
docker-compose build
docker-compose push
```

@[1]
@[2]
@[3]

---
Fire up the registry frontend on [http://localhost:8080](http://localhost:8080) and watch your built images.
Docker images are contained in the docker volume `docker_images`.

TODO: image

---

@title[Step 2. Export]

TODO:

- Export docker volume with built images `docker_images`,
  cf.: [moby/issues/31417: how can i export an docker volume to a zip or tar file](https://github.com/moby/moby/issues/31417#issuecomment-283033514)
- How to retag images?

---

@title[Step 3. Run]

TODO
