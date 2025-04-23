# syntax=docker/dockerfile:1

FROM golang:1.22 AS build

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum main.go ./
COPY template ./template
RUN go mod download
# RUN go get github.com/gin-gonic/gin

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/reference/dockerfile/#copy
# COPY *.go ./

# RUN go run main.go

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o web-gin

# Optional:
# To bind to a TCP port, runtime parameters must be supplied to the docker command.
# But we can document in the Dockerfile what ports
# the application is going to listen on by default.
# https://docs.docker.com/reference/dockerfile/#expose
EXPOSE 8080

# Run
CMD ["/app/web-gin"]


FROM debian:bookworm AS runner

WORKDIR /app

COPY --from=build /app/web-gin /app
COPY --from=build /app/template /app/template

EXPOSE 8080


# ENTRYPOINT ["/app/web-gin"]
CMD ["/app/web-gin"]


# docker build --tag go-web-gin .
# docker build -t go-web-gin:0.0.1 .

