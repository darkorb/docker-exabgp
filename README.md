# docker-exabgp

Fork of [mikenowak/docker-exabgp](https://github.com/mikenowak/docker-exabgp) so that it can be kept updated via Renovate & Azure Pipelines.

---

A simple docker container to announce unicast routes for docker containers.

This container is based on Alpine Linux, in an effort to keep it as small as possible.

The container works with `NET_ADMIN` capabilities and `net=host` to add loopback interfaces to the host OS.

The routes are then advertised to neighbours.

Run as follows:

```
docker run -d --name exabgp --restart always -p 179:179 \
           --cap-add=NET_ADMIN --net=host \
           -v exabgp-conf:/usr/etc/exabgp darkorb/exabgp
```

PRs welcome.
