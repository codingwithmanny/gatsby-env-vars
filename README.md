# Gatsby Environment Variable Project

First implementation of passing environment variables to docker image running Gatsby.

## Requirements

- Docker
- NodeJS
- Yarn

## Docker Setup

**Building:**

```bash
docker build . -t gatsby-building;
```

**Running:**

```bash
docker run -it -d -p 8000:80 -e GATSBY_API_URL=https://jsonplaceholder.typicode.com --name gatsby gatsby-building;
```
