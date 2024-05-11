FROM ubuntu:20.04

# set environment for location and language
ENV DEBIAN_FRONTEND=noninteractive
# environment variables for asia Ho Chi Minh
ENV TZ=Asia/Ho_Chi_Minh

# update and install dependencies
RUN apt-get update -y 
# install python 3.9.16 and pip
RUN apt-get install -y python3.9 python3-pip python3.9-dev build-essential
# add python3.9 to alternatives
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
# install python dependencies
RUN --mount=type=cache,target=/root/.cache/pip pip3 install --upgrade pip

# copy all folders and files to /app
WORKDIR /app
COPY . /app

# install python dependencies
RUN pip3 install -r requirements.txt
# RUN pip3 install torch==1.13.0+cu116 torchvision==0.14.0+cu116 -f https://download.pytorch.org/whl/torch_stable.html

# install git and some dependencies
RUN apt-get update && apt-get install -y git libgl1-mesa-glx libglib2.0-dev
