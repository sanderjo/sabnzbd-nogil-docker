# sabnzbd-nogil-docker
docker with SABnzbd with python3.13 with No GIL (nogil)

Hacked together:
- python3 module cryptography removed
- override sabctools non-compliancy from commandline

Result: it works. At least: sabnzbd is downloading. 

Question: is this version faster (in case the CPU single-core is the bottleneck)?

![image](https://github.com/user-attachments/assets/9ed67913-c0af-4897-9ba7-50880b717463)

# Notes

Does not work on riscv64
