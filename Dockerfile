FROM debian:buster

# Copy required scripts and files into the container
COPY build_nginx.sh apt-requirements.txt python-requirements.txt install_apt_packages.sh build_python.sh cleanup-files.txt cleanup.sh ./

# Update apt package list
RUN apt update

# Install apt packages listed in apt-requirements.txt
RUN bash install_apt_packages.sh

# Build a custom version of nginx with a couple of extra modules
RUN bash build_nginx.sh
# Add the custom built nginx to path
ENV PATH=/opt/nginx/sbin:$PATH
RUN mkdir -p /var/log/nginx

# Build python (the latest version available in apt is quite old)
RUN bash build_python.sh
# Install python packages listed in python-requirements.txt
RUN pip install -r python-requirements.txt

# Cleanup files to not clutter the final image
RUN bash cleanup.sh

CMD bash