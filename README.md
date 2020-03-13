# Hexo Auto Deploy

Auto deploy of hexo-generated static files using Hexo CLI.
The action uses parameters to specify the deploy destination respository information.
If the deploy destination is the same repository where the action is being executed, then the parameters may use the default values, since the default values are obtained from the environment variables.

## Docker Container included software
- Alpine v3.11 base image
- Git - latest
- Node - latest
- hexo-cli and dependant node packages - latest