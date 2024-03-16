FROM deepnote/python:3.7

RUN sudo apt-get -y update
RUN sudo apt-get install -y --fix-missing \
    cmake \
    libgtk2.0-dev 
RUN sudo apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN cd ~ && \
    mkdir -p dlib && \
    git clone -b 'v19.9' --single-branch https://github.com/davisking/dlib.git dlib/ && \
    cd  dlib/ && \
    python3 setup.py install --yes USE_AVX_INSTRUCTIONS

RUN pip install face_recognition