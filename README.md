# [kibble.bongo.zone](https://kibble.bongo.zone/)
My OpenBSD gateway configuration, connected to [NYCMesh](https://nycmesh.net). Inteded as a how-to guide, in case I ever break this thing.

* [dmesg](http://dmesgd.nycbug.org/index.cgi?do=view&id=3701)
* [Todo items](https://github.com/bongozone/kibble/issues)

## Network configuration

I connect to NYCMesh [Node 1340](https://docs.nycmesh.net/nodes/node-1340/).

```
                                  +--------------------+
                                  | kibble             |
                                  |--------------------|
     NYCMesh                      |                    |
        ^                         |em 0  1  2  3  4  5 |
        |                         +---+--+--+----------+

+-------+------+    +---------+ 1Gbps |  |  |
| nycmesh 1340 +----+ antenna |-------+  |  |
+--------------+    +---------+          |  |
                                         |  |
                    +---------+ 100Mbps  |  |
          WiFi <----+ airport +----------+  |
                    +---------+             |
                                            |
                    +---------+ 1Gbps       |
                    | macmini +-------------+
                    +---------+
```
<!-- http://www.asciidraw.com/ -->

## Installation Overview
1. Configure and install OpenBSD
2. Install packages
3. Configure services

### Install packages with `pkg_add` 

```bash
pkg_add alpine arpwatch bash coreutils curl git go intel iperf3 irssi keybase lynx miniupnpd nmap rsync the_silver_searcher tmux-mem-cpu-load vim wget zsh
```

**Try to populate from `/var/backups/pkglist.current`**

## Features

TODO

## References

* [vedetta](https://github.com/vedetta-com/vedetta) - OpenBSD Router Boilerplate
* [FQ-CoDel and pf](https://www.reddit.com/r/openbsd/comments/75ps6h/fqcodel_and_pf/) - Flows queue discpline for `pf`
* [Fixing bufferbloat on your home network with OpenBSD 6.2 or newer](https://pauladamsmith.com/blog/2018/07/fixing-bufferbloat-on-your-home-network-with-openbsd-6.2-or-newer.html)