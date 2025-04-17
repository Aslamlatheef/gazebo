# Start from your current base
FROM ghcr.io/sloretz/ros:noetic-simulators-osrf

ENV NVIDIA_DRIVER_CAPABILITIES=all
ENV QT_X11_NO_MITSHM=1
ENV GAZEBO_MODEL_PATH=/usr/share/gazebo-11/models
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gazebo11 \
    libgazebo11-dev \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control \
    git curl net-tools vim \
    x11-apps xvfb ros-noetic-xacro \
    nodejs npm python3-pip nginx \
    libjansson-dev imagemagick \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Add ros user
RUN useradd -m rosuser && \
    mkdir -p /home/rosuser/.gazebo && \
    chown -R rosuser:rosuser /home/rosuser

# Install gzweb from source
USER rosuser
WORKDIR /home/rosuser
RUN git clone https://github.com/osrf/gzweb.git && \
    cd gzweb && \
    ./deploy.sh -m

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh
USER rosuser

ENTRYPOINT ["/entrypoint.sh"]
