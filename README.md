docker nzbdrone

This is a Dockerfile setup for nzbdrone - http://nzbdrone.com/

To run:

docker run -d --name=nzbdrone -h hostname -v /path/to/config:/config -v /path/to/downloads:/downloads -v /path/to/tv/shows:/tv -p 8989:8989 needo/nzbdrone