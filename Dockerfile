FROM golang:1.8 as builder

WORKDIR /go/src/app
COPY . .

RUN go get github.com/mgutz/minimist
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o 301

FROM scratch

COPY --from=builder /go/src/app/301 /bin/301

ENTRYPOINT [ "/bin/301" ]