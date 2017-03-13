FROM p4lang/p4c
MAINTAINER lylandris <lylandris.jiang@gmail.com>

WORKDIR /source

ENTRYPOINT ["/p4c/build/p4c-bm2-ss"]

CMD ["--help"]
