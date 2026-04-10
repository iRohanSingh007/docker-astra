FROM centos:7

# Fix broken yum repos (CentOS 7 EOL)
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo

# Install packages
RUN yum install -y tcpdump vim less curl && yum clean all
# Create bin directory
RUN mkdir -p /usr/bin

# Download binaries from GitHub (raw links)
RUN curl -L -o /usr/bin/astra https://raw.githubusercontent.com/herc1/docker-astra/master/bin/astra && \
    curl -L -o /usr/bin/ffmpeg https://raw.githubusercontent.com/herc1/docker-astra/master/bin/ffmpeg && \
    curl -L -o /usr/bin/ffprobe https://raw.githubusercontent.com/herc1/docker-astra/master/bin/ffprobe && \
    chmod +x /usr/bin/astra /usr/bin/ffmpeg /usr/bin/ffprobe

ENTRYPOINT ["/usr/bin/astra"]
