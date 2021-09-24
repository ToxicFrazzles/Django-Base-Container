FROM debian:buster

COPY apt-requirements.txt python-requirements.txt install_apt_packages.sh build_python.sh ./
RUN bash install_apt_packages.sh
RUN bash build_python.sh
RUN pip install -r python-requirements.txt
RUN bash cleanup.sh

CMD bash