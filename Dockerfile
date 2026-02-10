FROM golang:1.21-alpine As build As
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o ascii-art-web
FROM alpine:latest
WORKDIR /app
COPY --from=build/app/ascii-art-web
EXPOSE 8080
CMD["./ascii-art-web"]

CMD ["echo", "hello world, I'm Evans"]