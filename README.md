# [kibble.bongo.zone](http://kibble.bongo.zone/)
My OpenBSD gateway configuration, connected to [NYCMesh](https://nycmesh.net). Intended as a how-to guide, in case I ever break this thing.

* [dmesg](http://dmesgd.nycbug.org/index.cgi?do=view&id=3701)
* [Todo items](https://github.com/bongozone/kibble/issues)

## Network configuration

I connect to NYCMesh [Node 1340](https://docs.nycmesh.net/nodes/node-1340/).

```
 +-------------------+ +--------------------------------------------------+
 | Edge router (NAT) | | kibble.bongo.zone                                |
 +-------+----+------+ |--------------------------------------------------|
         |    |        |                                     2            |
         |    v        |                                  +-------------+ |
DE/CIX<--+ NYCMesh     |                                  |  1          | |
              ^        |      bridge 0                 +----------+     | |
              |        |      +--+--+--+--+---------+----------------+  | |
      +-------+------+ |      |  |  |  |  |         |  |  |       |  |  | |
      | nycmesh 1340 | |      +  +  +  +  +         +  +  +       +  +  | |
      +-------+------+ |em 0  1  2  3  4  5  vether 0  1  2  vlan 0  1  2 |
              |        +------+--+--------------------------------+--+--+-+
+-------------+----+ 1Gbps |  |  |                                [  [  [
| nycmesh-lbe-1659 +-------+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%~~%
+------------------+          |  |                                [ VLAN tags
                              |  |                                ] 1: antenna admin
         +---------+ 100Mbps  |  |  VLAN tag for public SSID      [ 2: egress traffic
         + airport +----------+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
         +-+-- --+-+             |
           |     |               |
           |     v               |
           v    Private WiFi     |
         Public     ^            |
          WiFi      |            |
               +----+----+ 1Gbps |
               | macmini +-------+
               +---------+
```
<!-- http://www.asciidraw.com/ -->

## Installation Overview
1. Configure and install OpenBSD
2. Install packages
3. Configure services

### Install packages with `pkg_add` 

```bash
pkg_add alpine arping arpwatch bash bsd-airtools coreutils curl git gmake go hping htop intel-firmware \
 iperf3 irssi keybase lynx miniupnpd mosh nmap pkglocatedb py-pip quirks rsync rtl-sdr sshguard \
 the_silver_searcher tmux-mem-cpu-load urtwn-firmware vim vmm-firmware w3m wget zsh
```
<!--
Try to populate from `pkg_info -m | cut -d ' ' -f 1| sed 's/-[1234567890].*//'`
-->

## Features

TODO

## References

* [vedetta](https://github.com/vedetta-com/vedetta) - OpenBSD Router Boilerplate
* [FQ-CoDel and pf](https://www.reddit.com/r/openbsd/comments/75ps6h/fqcodel_and_pf/) - Flows queue discpline for `pf`
* [Fixing bufferbloat on your home network with OpenBSD 6.2 or newer](https://pauladamsmith.com/blog/2018/07/fixing-bufferbloat-on-your-home-network-with-openbsd-6.2-or-newer.html)


<!--

Updating files -- mount the root file system in ./mnt using sshfs

sshfs -o sshfs_debug -o reconnect root@kibble.bongo.zone:/ ~/mnt/kibble

Copy over updated files only:

rsync -v --existing mnt/etc/* src/etc
rsync -v --existing mnt/var/* src/var


-->