FROM clojure:openjdk-8-slim-buster AS base_image

COPY . .
CMD ["echo Hello"]


ARG USERNAME=container
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG WORK_DIR=/home/$USERNAME

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --create-home --shell /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME


USER $USERNAME
