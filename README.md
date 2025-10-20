# sabnzbd-nogil-docker
docker with SABnzbd with python3.14 with No GIL (nogil)

Hacked together:
- python3 module cryptography removed
- override sabctools non-compliancy from commandline

Result: it works. At least: sabnzbd is downloading. 

Question: is this version faster (in case the CPU single-core is the bottleneck)?

![image](https://github.com/user-attachments/assets/9ed67913-c0af-4897-9ba7-50880b717463)

# create docker

```
docker build -t sabnzbd-nogil .
```

# run docker

Lazy, for testing

```
mkdir ~/sab-config
docker run -p 8080:8080 -v ~/sab-config:/config sabnzbd-nogil
```
More directories specified (but also needed within SAB's GUI)

```
docker run -p 8080:8080 -v ~/sab-config:/config -v ~/sab-download:/downloads -v ~/sab-incomplete:/incomplete-downloads sabnzbd-nogil
```

Add the below to get ipv6 etc:

```
--net=host --restart unless-stopped -d
```

# Notes

Does not work on riscv64 because deadsnakes does not support riscv64
