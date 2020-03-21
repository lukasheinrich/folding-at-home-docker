# Folding@home Docker images

Docker images for [Folding@home](https://foldingathome.org/) with GPU support

[![Docker Pulls](https://img.shields.io/docker/pulls/lukasheinrich/folding)](https://hub.docker.com/r/lukasheinrich/folding)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/lukasheinrich/folding/simple)](https://hub.docker.com/r/lukasheinrich/folding/tags?name=latest)

## Build image

```
docker build -t lukasheinrich/folding:latest . -f Dockerfile
```

## Usage

```
docker run --rm lukasheinrich/folding:latest
```
