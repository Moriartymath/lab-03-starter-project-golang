FROM golang:1.22.0-alpine AS build

WORKDIR /lab3-go

COPY go.mod .

COPY go.sum .
COPY main.go .
RUN go mod download
COPY cmd cmd
COPY lib lib
COPY templates templates

RUN go build -o build/fizzbuzz

FROM scratch

WORKDIR /lab3-go

COPY --from=build /lab3-go/templates templates

COPY --from=build /lab3-go/build/fizzbuzz /fizzbuzz

CMD ["/fizzbuzz", "serve"]