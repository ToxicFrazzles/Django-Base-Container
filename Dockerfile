FROM python:3

# Copy required scripts and files into the container
COPY python-requirements.txt ./

# Install python packages listed in python-requirements.txt
RUN pip install -r python-requirements.txt

# Cleanup files to not clutter the final image
RUN rm python-requirements.txt

CMD bash