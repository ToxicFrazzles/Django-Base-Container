FROM python:3

# Copy required scripts and files into the container
COPY python-requirements.txt ./

# Install python packages listed in python-requirements.txt
RUN pip install -r python-requirements.txt

# Cleanup files to not clutter the final image
RUN rm python-requirements.txt

RUN apt update
RUN apt install -y lsb-release
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt update && apt install vault -y
RUN apt clean all

CMD bash