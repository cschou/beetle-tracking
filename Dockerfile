FROM asgpu/notebook:tf-1.10-9d4973b6
LABEL maintainer=afun@afun.tw
SHELL ["/bin/bash", "-c"]
WORKDIR /root/project

# Set locale
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# packing project code and model into image
COPY . /root/project
RUN /bin/bash download_data.bash
RUN apt-get install -y libglib2.0-0 libsm6 libxrender-dev
RUN /bin/bash download_data.bash
RUN /bin/bash /root/project/setup.bash

# support jupyter
RUN pip3 install jupyter jupyterhub