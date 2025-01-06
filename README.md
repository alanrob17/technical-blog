# Portfolio

This is my temporary blog site. It is hosted at Netlify as [alanrobson.au](https://alanrobson.au "My technical blog").

See Git\Notes\Using-Hugo.md for notes on how to update the site.

I have added Docker containers to run and test Hugo

## hugo-nginx-docker

A multistage dockerfile serving a Hugo.io flatfile site.

Running this requires Docker and Docker Compose installed.

## Local build and run

```bash
docker-compose build
docker-compose up -d
```

The site is now available on http://localhost:8000