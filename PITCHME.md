@title[Introduction]
## Offline <span style="color: #e49436">Docker</span>

#### How to use docker for (almost) continuous delivery to an offline environment.*
<br>
<br>
<span style="color: #bbb; font-size: 80%">[ Docker, Compose, Linux, Windows ]</span>

---

### <span style="color: #e49436">Initial Situation</span>

- Apps built with Docker |
- Orchestrated with docker-compose |

---

### <span style="color: #e49436">Production Environment</span>

- disconnected, |
- remote or |
- just inaccessible. |
- How to deploy? |

---

### <span style="color: #e49436">Docker Workflow</span>

- Similar to Git:
  - Git: Workflow for code |
  - Docker: Workflow for runtime images |

---
<!-- .slide: data-background-transition="none" -->
### <span style="color: #e49436">Changes, Revisions</span>

- [git commit](https://git-scm.com/docs/git-commit) |
- [docker commit](https://docs.docker.com/engine/reference/commandline/commit/), [docker build](https://docs.docker.com/engine/reference/commandline/build/) |

---

### <span style="color: #e49436">Tagging</span>

- [git tag](https://git-scm.com/docs/git-tag) |
- [docker tag](https://docs.docker.com/engine/reference/commandline/tag/) |

---

### <span style="color: #e49436">Publish</span>

- [git push](https://git-scm.com/docs/git-push) |
- [docker push](https://docs.docker.com/engine/reference/commandline/push/) |

---

### <span style="color: #e49436">Consume</span>

- [git pull](https://git-scm.com/docs/git-pull) |
- [docker pull](https://docs.docker.com/engine/reference/commandline/pull/) |

---

### <span style="color: #e49436">Transfer Medium (online)</span>

- git server (e.g. [GitHub](https://github.com/)) |
- docker registry (e.g. [DockerHub](https://hub.docker.com/)) |

---

### <span style="color: #e49436">Transfer Medium (offline)</span>

- [git bare repository](https://git-scm.com/book/en/v2/Git-on-the-Server-Getting-Git-on-a-Server) |
- [docker registry (custom)](https://docs.docker.com/registry/) |

---

# Demo

+++

@title[Step 1. Build & Push]

### <span style="color: #e49436">STEP 1. Build & Push</span>
<br>

```console
$ docker-compose up -d registry ui
$ docker-compose build
$ docker-compose push
```

@[1](Start local Docker registry (on `:5000`, Web UI at [:8080](http://localhost:8080)))
@[2](Build all apps (...tag to `localhost:5000`))
@[3](Push built images to registry)

+++

Registry frontend on [:8080](http://localhost:8080)

![See docker images](images/ui-02-pushed.png)

+++
@title[Step 2. Export]

### <span style="color: #e49436">STEP 2. Export</span>
<br>

```console
docker-compose run export
docker save -o ./data/registry.tar registry:2.6.2 konradkleine/docker-registry-frontend:v2
```

@[1](Export volume `docker_images -> ./data/docker_images.bz2`.)
@[2](Save `registry` images (you're offline, remember?))

+++
@title[Step 3. Ship It!]

### <span style="color: #e49436">STEP 3. Ship It!*</span>
<br>

![Cat customer waiting...](https://media.giphy.com/media/dw2jpsey5a5I4/giphy.gif)

<span style="color: #bbb; font-size: 80%">*Not our business here.</span>

+++
@title[Step 4. Import & Run]

### <span style="color: #e49436">STEP 4. Import & Run</span>
<br>

```console
docker load -i ./data/registry.tar
docker-compose run import
docker-compose up -d registry ui
docker run [registry:5000]/mycompany/myapp:latest
```

@[1](Load `registry` images (you're offline, rembember?))
@[2](Import volume `./data/docker_images.bz2 -> docker_images`)
@[3](Start your registry)
@[4](Run images, pulling from your registry)

---

### Ok, got it! How to apply to my project?

+++?code=docker-compose.yml&lang=yml

In your `docker-compose.yml`:

@[5](Tag images to local registry `localhost:5000`)

+++?code=docker-compose.override.yml&lang=yml

Add this [docker-compose.override.yml](https://github.com/awesome-inc/docker-deploy-offline/blob/master/docker-compose.override.yml) for:

@[11-13](Docker registry)
@[24-25](Web UI for registry)
@[43-45,47-49](Export & Import)
@[51-52](Docker volume for registry images)

- That's it! |

---

### View The <a target="_blank" href="https://github.com/awesome-inc/docker-deploy-offline">Code</a>
