FROM ubuntu:22.04

ENV PATH="${PATH}:~/.local/bin"

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN sed -i -e 's/#force_color_prompt=yes/force_color_prompt=yes/g' /root/.bashrc

# update base image
RUN apt update
RUN apt install -y \
    libsdl2-dev \
    qttools5-dev-tools \
    pyqt5-dev-tools \
    python3 \
    python3-pip \
    python3-pyqt5 \
    python3-pyqt5.qtopengl

# copy repository files
WORKDIR /mupen64plus/
COPY . .

# update python dependendies
RUN pip install -r requirements.txt --user
RUN python3 setup.py build
RUN python3 setup.py install --user

#CMD ["m64py"]
CMD ["/root/.local/bin/m64py"]
