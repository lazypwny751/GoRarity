FROM ubuntu

WORKDIR "/opt/goraritygo"
COPY . .

RUN apt update
RUN apt install -y dep1 dep2 dep3
RUN make build
RUN make install

ENTRYPOINT ["/opt/goraritygo/goraritygo"]
