FROM golang:1.22.0-bookworm

COPY go.mod .

COPY go.sum .

COPY main.go .

RUN go mod download

COPY cmd cmd

COPY lib lib

COPY templates templates

RUN go build -o build/fizzbuzz

CMD ["./build/fizzbuzz", "serve"]