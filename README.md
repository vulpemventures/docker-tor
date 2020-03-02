# Docker Tor

Publish your own Onion Service with Docker


## Example

This docker-compose will help setup your onion service.

* Expose your web server on port `8080`
* Name the container of the web server `hiddenweb`
* Create a folder `tor_keys` and do `chmod 2700 tor_keys`
* Run with `docker-compose up -d`
* You can get the onion address with `bash onion`

```
version: '3'
services:
  # Web server
  hiddenweb:
    container_name: hiddenweb
    build: ./server
    ports:
      - 8080:8080
    restart: unless-stopped
  
  # Tor Hidden Service v3
  tor:
    container_name: tor
    build: https://github.com/vulpemventures/docker-tor
    volumes:
      - ./tor_keys:/var/lib/tor/hidden_service/
    depends_on: 
      - hiddenweb
    restart: unless-stopped
```


