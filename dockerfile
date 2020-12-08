#Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="ghedirakais@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for \ the MultiQC Services."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

#Define our defqult shell to BASH
ENV SHELL /bin/bash
ENV PATH /opt/anaconda3/bin:$PATH
RUN echo $SHELL
RUN echo 'this is my shell' $SHELL
RUN apt-get update -y -qq && apt-get install curl apt-utils -y -qq > /dev/null
RUN curl  https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh -o Anaconda3-2020.11-Linux-x86_64.sh
RUN bash Anaconda3-2020.11-Linux-x86_64.sh -b -p /opt/anaconda3 
RUN echo $SHELL
RUN source /opt/anaconda3/bin/activate base
RUN conda init bash
RUN exec bash
RUN echo $SHELL
RUN conda update --all -y
RUN conda create --name py3.7 python=3.7 -q -y
#RUN source ~/.bashrc
RUN echo $SHELL
RUN which conda
RUN cat ~/.bashrc
RUN source /opt/anaconda3/bin/activate py3.7
RUN conda install -c bioconda -c conda-forge multiqc -y -q
RUN multiqc --help

