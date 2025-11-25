from node:25-alpine

ARG GID
ARG UID

RUN cat /etc/passwd
RUN apk update 
RUN apk add git shadow
RUN git clone https://github.com/google-gemini/gemini-cli
RUN cd gemini-cli && npm install -g @google/gemini-cli

# Note: The node Docker image already uses UID 1000 / GID 1000 which
#       clashes with the default UID/GID for the first non-root user on my Ubuntu 24.04 LTS system
# RUN groupadd -g $GID user
# RUN useradd -u $UID -m -G $GID user
RUN mkdir -p /workspace
RUN chown -R $UID:$GID /workspace

COPY entry-point.sh /home/node
RUN chown $UID:$GID /home/node/entry-point.sh
RUN chmod uog+x /home/node/entry-point.sh

USER node
ENTRYPOINT ["/home/node/entry-point.sh"]
