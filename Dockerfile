FROM node:8-jessie

LABEL maintainer="Coby Tamayo <ctamayo@sitecrafting.com>" license="MIT"

# Install Docker dependencies/boilerplate
RUN apt-get update && \
  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common && \
  # Add official Docker GPG key
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Install Lando/Cypress dependencies, including Docker
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable" && \
  apt-get update && \
  apt-get install -y \
    xvfb \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    iptables \
    docker-ce

# Install Lando
RUN wget -O lando.latest.deb \
    https://github.com/lando/lando/releases/download/v3.0.0-beta.47/lando-v3.0.0-beta.47.deb && \
  dpkg -i lando.latest.deb && \
  rm lando.latest.deb
