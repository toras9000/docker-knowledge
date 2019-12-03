# knowledge Docker Image

[This](https://hub.docker.com/r/toras9000/knowledge) is a docker image of the Free Knowledge Management System [knowledge](https://github.com/support-project/knowledge).  

There are also images published by the author. ([koda/docker-knowledge](https://hub.docker.com/r/koda/docker-knowledge))

## Tags

- latest ([Dockerfile](https://github.com/toras9000/docker-knowledge/blob/master/build/Dockerfile))

- v1.13.1 ([Dockerfile](https://github.com/toras9000/docker-knowledge/blob/v1.13.1/build/Dockerfile))

## Usage Container

If you run for trial.  
The container provides services on port 8080.  

```bash
$ docker run -d -p 8080:8080 toras9000/knowledge
```

An example of persistence is as follows:

```bash
$ docker run -d \
             -p 8080:8080 \
             -v /opt/knowledge/data:/root/.knowledge \
             toras9000/knowledge
```

## Data location

Assume that the following locations in the container are persisted:

- `/root/.knowledge`  
Storage directory for various data including an built-in database.

## Enviroment variables

- `COOKIE_ENCRYPT_KEY`  
Cookie encryption key. (default: empty)   
If it is empty, it will be a random string.  
If you want to keep the session beyond the container shutdown, specify a fixed string.

- `EDIT_PAGE_CUSTOM`  
Whether to customize the edit page a bit. (default: FALSE)   
Specify TRUE to overwrite with a custom view.

## Setup kallithea

There is a manual by the software author, so please refer to it for details.
- [knowledge Manual](https://information-knowledge.support-project.org/en/manual)

Here are some important points to pick up and present.

The administrative account prepared in the initial state is user id `admin` and password `admin123`.

In addition to the built-in database, PostgreSQL is supported as the data storage destination. For long-term operation, it is recommended to change the data storage destination to PostgreSQL.  
You can change the data storage location at any time because of the data migration function. Change the settings on the application management screen, not on the container.  
The database driver is included, so there is no need to prepare it separately.  
