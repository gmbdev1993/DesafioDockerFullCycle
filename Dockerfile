FROM golang:1.20.3-alpine3.17 as build

WORKDIR /usr/local/go/src/FullCycle
COPY . .

RUN go build main.go


FROM scratch
WORKDIR /
COPY --from=build /usr/local/go/src/FullCycle /

CMD ["./main"]

