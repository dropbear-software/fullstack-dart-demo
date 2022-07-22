# Note: You can use any Debian/Ubuntu based image you want. 
FROM mcr.microsoft.com/vscode/devcontainers/base:0-buster

# [Option] Install zsh
ARG INSTALL_ZSH="true"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="false"
# [Option] Enable non-root Docker access in container
ARG ENABLE_NONROOT_DOCKER="true"
# [Option] Use the OSS Moby Engine instead of the licensed Docker Engine
ARG USE_MOBY="true"
# [Option] Engine/CLI Version
ARG DOCKER_VERSION="latest"

# Enable new "BUILDKIT" mode for Docker CLI
ENV DOCKER_BUILDKIT=1

# Install needed packages and setup non-root user. Use a separate RUN statement to add your
# own dependencies. A user of "automatic" attempts to reuse an user ID if one already exists.
ARG USERNAME=automatic
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY library-scripts/*.sh /tmp/library-scripts/
RUN apt-get update \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true" \
    # Use Docker script from script library to set things up
    && /bin/bash /tmp/library-scripts/docker-in-docker-debian.sh "${ENABLE_NONROOT_DOCKER}" "${USERNAME}" "${USE_MOBY}" "${DOCKER_VERSION}" \
    # Clean up
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

VOLUME [ "/var/lib/docker" ]

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

ENV ENDUSER=vscode

# Download Flutter 
RUN git clone https://github.com/flutter/flutter.git -b stable /home/${ENDUSER}/.flutter

# Download Protocol Buffers Compiler
ENV PROTOC_VERSION=3.20.0
RUN curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
RUN unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d /home/${ENDUSER}/.local

# Download gRPC Web Proxy
ENV GRPC_WEB_PROXY_VERSION=0.15.0
RUN curl -LO https://github.com/improbable-eng/grpc-web/releases/download/v${GRPC_WEB_PROXY_VERSION}/grpcwebproxy-v${GRPC_WEB_PROXY_VERSION}-linux-x86_64.zip
RUN unzip grpcwebproxy-v${GRPC_WEB_PROXY_VERSION}-linux-x86_64.zip -d /home/${ENDUSER}/.grpcwebproxy
RUN mv /home/${ENDUSER}/.grpcwebproxy/dist/grpcwebproxy-v${GRPC_WEB_PROXY_VERSION}-linux-x86_64 /home/${ENDUSER}/.grpcwebproxy/dist/grpcwebproxy

# Download protolint
ENV PROTOLINT_VERSION=0.38.3
RUN curl -LO https://github.com/yoheimuta/protolint/releases/download/v${PROTOLINT_VERSION}/protolint_${PROTOLINT_VERSION}_Linux_x86_64.tar.gz
RUN tar -xf protolint_${PROTOLINT_VERSION}_Linux_x86_64.tar.gz --directory /tmp
RUN mv /tmp/protolint /home/${ENDUSER}/.local/bin/

# Delete files we no longer need
RUN rm protoc-${PROTOC_VERSION}-linux-x86_64.zip && rm grpcwebproxy-v${GRPC_WEB_PROXY_VERSION}-linux-x86_64.zip && rm protolint_${PROTOLINT_VERSION}_Linux_x86_64.tar.gz

# Update Path for Dart, Flutter and Protocol Buffers compiler
ENV PATH=/home/${ENDUSER}/.flutter/bin:/home/${ENDUSER}/.local/bin:/home/${ENDUSER}/.pub-cache/bin:/home/${ENDUSER}/.grpcwebproxy/dist:/home/${ENDUSER}/.pub-cache/bin:$PATH

# Correctly set permissions on the files and folders we just created
RUN chown -R $ENDUSER:$ENDUSER /home/${ENDUSER}/.flutter/ && chown -R $ENDUSER:$ENDUSER /home/${ENDUSER}/.local/ && chown -R $ENDUSER:$ENDUSER /home/${ENDUSER}/.grpcwebproxy/

# Setting the ENTRYPOINT to docker-init.sh will start up the Docker Engine 
# inside the container "overrideCommand": false is set in devcontainer.json. 
# The script will also execute CMD if you need to alter startup behaviors.
ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
CMD [ "sleep", "infinity" ]
