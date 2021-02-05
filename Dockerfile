FROM golang:alpine AS builder

WORKDIR /duplexity
COPY . .

RUN go build -o hello-world main.go

FROM scratch
WORKDIR /duplexity
COPY --from=builder /duplexity/hello-world .

ENTRYPOINT [ "/duplexity/hello-world" ]
