# Django Base Container

A container to build from for Django projects. Should speed up building images by pre-installing most dependencies.

## Usage:
TODO: Add instructions on how to use the image...


## Explanation:
This bit is for those people who think this all seems like magic.

`Dockerfile` describes how the image is built. What files are copied, what scripts are run
1. Start by copying required scripts and files into the image
2. Run the `install_apt_packages.sh` script
   1. Update apt
   2. Install packages listed in `apt-requirements.txt`
3. Run the `build_python.sh` script
   1. Define the python version as an environment variable for quick and easy updating
   2. Download a source code archive for the specified version
   3. Inflate the archive to obtain the source
   4. Enter the source directory
   5. Run `configure` with added optimisations
   6. Compile the source using the number of CPU cores the machine currently has
   7. Install the resulting python
   8. Remove the archive and source code
   9. Make it so that just running `python` or `pip` will use the freshly compiled Python
4. Run the newly installed `pip` to install the Python packages listed in `python-requirements.txt`
5. Run the `cleanup.sh` script to remove the files that are not needed in the final copy of the image
   1. Remove the files listed in `cleanup-files.txt`
   2. Remove the `cleanup-files.txt` and `cleanup.sh` files themselves
6. Finally, define the default command if the image is just run to be `bash` to provide a shell for interacting with