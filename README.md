This is a short set of scripts to set up squid proxy both for HTTP + HTTPS.

It uses nice Debian-based squid3 Docker container from here: https://hub.docker.com/r/distahl/squid

1. Generate password auth file for squid proxy.
2. Generate self-signed SSL certificate (edit the script to set correct server address).
3. Start docker container with squid proxy
4. Test the connection to http://google.com (probably better to use httpbin, whatever)


