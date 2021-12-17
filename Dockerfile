FROM debian:9

USER root

RUN apt-get update && apt-get install -y locales && apt-get install -y python3-pip \
    && apt-get install -y ffmpeg && apt-get install -y wget && apt-get install -y libsndfile-dev \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && pip3 install cmake==3.18
ENV LANG en_US.utf8

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh -O miniconda.sh \
    && bash miniconda.sh -b && export PATH=~/miniconda3/bin:$PATH && . ~/miniconda3/etc/profile.d/conda.sh \
    && conda config --set report_errors false
