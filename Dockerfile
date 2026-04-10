FROM centos:7

RUN yum install -y tcpdump vim less curl

# Create bin directory
RUN mkdir -p /usr/bin

# Download binaries from GitHub (raw links)
RUN curl -L -o /usr/bin/astra https://raw.githubusercontent.com/herc1/docker-astra/master/bin/astra && \
    curl -L -o /usr/bin/ffmpeg https://raw.githubusercontent.com/herc1/docker-astra/master/bin/ffmpeg && \
    curl -L -o /usr/bin/ffprobe https://raw.githubusercontent.com/herc1/docker-astra/master/bin/ffprobe && \
    chmod +x /usr/bin/astra /usr/bin/ffmpeg /usr/bin/ffprobe

ENTRYPOINT ["/usr/bin/astra"]
