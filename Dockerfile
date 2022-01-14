FROM python:3

# Copy required scripts and files into the container
COPY apt-requirements.txt python-requirements.txt install_apt_packages.sh build_python.sh cleanup-files.txt cleanup.sh ./

# Update apt package list
#RUN apt update

# Install apt packages listed in apt-requirements.txt
#RUN bash install_apt_packages.sh

# Build python (the latest version available in apt is quite old)
# RUN bash build_python.sh
# Install python packages listed in python-requirements.txt
RUN pip install -r python-requirements.txt

# Cleanup files to not clutter the final image
RUN bash cleanup.sh

CMD bash