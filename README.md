### Run gemini inside a docker container

This Dockerfile & docker compose YAML will create a Docker image (based on the node:25-alpine image) containing the latest 
version of Google Gemini (cloned from https://github.com/google-gemini/gemini-cli).

This has been developed/tested on a Ubuntu 24.04 LTS so YMMV.

# Important

The node:25-alpine image uses UID/GID 1000 for the "node" user ; this happens to clash with the default UID/GID of the first non-root user
on at least my Ubuntu system so the Dockerfile does not attempt to create a user with that UID/GID inside the image, instead it
just reuses the already existing "node" user and group.

If your local account using a different UID/GID, you'll have to modify both the Dockerfile to create the respective user account+homedir and/or group
as well as adjust the "user" line in the docker-compose.yml file.

# Usage

NOTE: I've had some weird glitches using the URL-based authentication methods so I guess it's best to setup a "Google AI Studio" account/project and export the API key as "GEMINI_API_KEY" environment (the docker-compose.yml file will automatically propagate that variable into the container)

Assuming you have Docker setup locally and Bash installed, just running

     run.sh

should get you up & running.

The "workspace" folder will be mounted at /workspace inside the container and gemini-cli will automatically get started inside that folder.
