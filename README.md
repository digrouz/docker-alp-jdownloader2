# docker-alp-jdownloader2
Install JDownloader into a Linux container

![JDownloader](http://jdownloader.org/_media/knowledge/wiki/jdownloader.png)

## Description

JDownloader is a free, open-source download management tool with a huge community of developers that makes downloading as easy and fast as it should be. 
Users can start, stop or pause downloads, set bandwith limitations, auto-extract archives and much more. 
It's an easy-to-extend framework that can save hours of your valuable time every day!

http://jdownloader.org/

## Usage
    docker create --name=jdownloader  \
      -v <path to downloads>:/downloads  \
      -v <path to config>:/opt/JDownloader/cfg   \
      -v /etc/localtime:/etc/localtime:ro   \
      -e DOCKUID=<UID default:10018> \
      -e DOCKGID=<GID default:10018> \
      -e DOCKJDPASSWD=<myjdownloader account password> \
      -e DOCKJDMAIL=<myjdownloader account email> \
      -e DOCKJDNAME=<jdownloader instance name> \
      digrouz/docker-alp-jdownloader2


## Environment Variables

When you start the `jdownloader` image, you can adjust the configuration of the `jdownloader` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `10018`.

### `DOCKGID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `10018`.

### `DOCKJDPASSWD`

This variable is mandatory and specifies the password to be used to connect to myjdownloader, allowing to remote administer the instance.

### `DOCKJDMAIL`

This variable is mandatory and specifies the email to be used to connect to myjdownloader, allowing to remote administer the instance.

### `DOCKJDNAME`

This variable is not mandatory and specifies the instance name to be used to connect to myjdownloader.

## Notes

* The docker entrypoint will upgrade operating system at each startup.

