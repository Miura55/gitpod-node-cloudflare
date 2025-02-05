FROM gitpod/workspace-full:latest

SHELL ["/bin/bash", "-c"]

RUN sudo apt-get update \
    && sudo apt-get update \
    && sudo apt-get clean \
    && sudo rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/*

# Install Cloudflared
RUN wget https://github.com/cloudflare/cloudflared/releases/download/2025.2.0/cloudflared-linux-amd64.deb \
    && sudo apt install -y ./cloudflared-linux-amd64.deb 

# Install Yarn
RUN npm install -g yarn
# Install pnpm
RUN npm install -g pnpm

WORKDIR /home/gitpod/

USER gitpod
