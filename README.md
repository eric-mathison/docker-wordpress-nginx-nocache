# Nginx Docker Image with FastCGI (No Caching)

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/eric-mathison/docker-wordpress-nginx-nocache/Build%20Docker%20Image%20and%20Push?style=for-the-badge)

This is a Nginx Docker Image designed to work with this [Wordpress PHP Docker Image](https://github.com/eric-mathison/docker-wordpress-php).  
This image **does not** include any type of Nginx caching. This is useful for development containers or for use with page caching type Wordpress plugins.

## Defaults

This image sets the `worker_processes` to `auto`. This directive is set in the `Dockerfile`.

Default html block directives can be found in `conf/default.conf`. These settings can be changed to any value.

Virtual Server block directives are configured in the files located in the `/global/` directory.

-   `/global/locations.conf.template` Location Rules
-   `/global/proxy.conf.template` RealIP Rules
-   `/global/secure.conf.template` Basic Security Rules

## Proxying

If you are using this Nginx image behind a reverse proxy like Cloudflare or a Docker Load Balancer, you can add the IP address(es) of the load balancer to the `/global/proxy.conf.template` file.

## GH Actions

This repo is configured to automatically build this Docker image and upload it to your Docker Hub account.

1. To setup this action, you need to set the following enviroment secrets:

-   `DOCKERHUB_USERNAME` - this is your Docker Hub username
-   `DOCKERHUB_TOKEN` - this is your Docker Hub API key

2. You need to update the tags for the build in `/.github/workflows/deploy.yml` on line 26.
