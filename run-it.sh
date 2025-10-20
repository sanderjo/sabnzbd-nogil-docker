docker run -p 8080:8080 -v ~/sab-config:/config -v ~/sab-download:/downloads -v ~/sab-incomplete:/incomplete-downloads sabnzbd-nogil

# or if you want ipv6 inside the docker, always run, as daemon: add these options
# --net=host --restart unless-stopped -d
