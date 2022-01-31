# Django Base Container

A container to build from for Django projects. Should speed up building images by pre-installing most dependencies.

## Usage:
TODO: Add instructions on how to use the image...


## Explanation:
This bit is for those people who think this all seems like magic.

`Dockerfile` describes how the image is built. What files are copied, what scripts are run
1. Using the latest Python 3 container image
2. Copy the `python-requirements.txt` file to the image
3. Install the python requirements on the image
4. Remove the `python-requirements.txt` file
5. Default command when running the image standalone is `bash`