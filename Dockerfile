FROM debian:buster

COPY apt-requirements.txt python-requirements.txt install_apt_packages.sh build_python.sh cleanup-files.txt cleanup.sh ./
RUN apt update
RUN apt install ca-certificates git curl wget gnupg -y --no-install-recommends
RUN wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -
RUN echo "deb http://openresty.org/package/debian buster openresty" \
    | tee /etc/apt/sources.list.d/openresty.list
RUN bash install_apt_packages.sh
RUN bash build_python.sh
RUN pip install -r python-requirements.txt
RUN bash cleanup.sh

CMD bash