# sabnzbd-nogil-docker
docker with SABnzbd with python3.14 with No GIL (nogil)

Hacked together:
- python3 module orjson commented out
- use `-Xgil=0` to override warning about non-compliant modules

Result: it works. At least: sabnzbd is downloading. 

Question: is this version faster (in case the CPU single-core is the bottleneck)?

<img width="777" height="367" alt="image" src="https://github.com/user-attachments/assets/74337771-b713-4235-b292-e1dbac9e05d8" />


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

Your logging should show:
```
2025-10-20 21:33:39,869::INFO::[SABnzbd:1138] python version 3.14.0 free-threading build (main, Oct  7 2025, 16:05:28) [GCC 13.3.0]
2025-10-20 21:33:39,870::INFO::[SABnzbd:1140] GIL is off (unsafe)
```


# Notes

Does not work on riscv64 because deadsnakes does not support riscv64
