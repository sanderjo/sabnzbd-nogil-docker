# sabnzbd-nogil-docker
docker with SABnzbd with python3.13 with No GIL (nogil)

Hacked together:
- python3 module cryptography removed
- overrigin sabctools non-compliancy from commandline

Result: it works. At least: sabnzbd is downloading. 

Question: is this version faster (in case the CPU single-core is the bottleneck)
