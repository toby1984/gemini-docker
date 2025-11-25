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

Assuming you have Docker setup locally and Bash installed, just running

     run.sh

should get you up & running.




