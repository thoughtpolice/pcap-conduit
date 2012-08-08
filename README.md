# Conduit <-> Pcap

`pcap-conduit` lets you use the Conduit package to iterate over network data, using
the `libpcap` API. It allows you to stream in both offline pcap dump files and live
network interfaces into a conduit `Source`.

[travis-ci.org](http://travis-ci.org) results: [![Build Status](https://secure.travis-ci.org/thoughtpolice/pcap-conduit.png?branch=master)](http://travis-ci.org/thoughtpolice/pcap-conduit)

# Installation

It's just a `cabal install` away:

```
$ cabal install pcap-conduit
```

# Join in

File bugs in the GitHub [issue tracker][].

Master [git repository][gh]:

* `git clone https://github.com/thoughtpolice/pcap-conduit.git`

There's also a [BitBucket mirror][bb]:

* `git clone https://bitbucket.org/thoughtpolice/pcap-conduit.git`

# Authors

See [AUTHORS.txt](https://raw.github.com/thoughtpolice/pcap-conduit/master/AUTHORS.txt).

# License

BSD3. See [LICENSE.txt](https://raw.github.com/thoughtpolice/pcap-conduit/master/LICENSE.txt) for terms of copyright and redistribution.

[main page]: http://thoughtpolice.github.com/pcap-conduit
[issue tracker]: http://github.com/thoughtpolice/pcap-conduit/issues
[gh]: http://github.com/thoughtpolice/pcap-conduit
[bb]: http://bitbucket.org/thoughtpolice/pcap-conduit
