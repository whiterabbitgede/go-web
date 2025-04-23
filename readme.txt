sudo apt install golang clang


# check version
go version

# init
go mod init web-gin

# main
nano main.go

# download
go get github.com/gin-gonic/gin


# download if go.sum is available use
go mod download

# run
go run main.go

# build
go build

CGO_ENABLED=0 GOOS=linux go build -o web-gin

# runner
./web-gin







# additional build
CGO_ENABLED=0 GOOS=linux go build 

CGO_ENABLED=1 (default):
    Cgo allows Go programs to call C code.



# GOOS is an environment variable that specifies the target operating system
GOOS=windows go build 
GOOS=linux go build -o linux-web-gin
GOOS=darwin go build -o macos-web-gin

Common values for GOOS include:
    linux - for Linux systems (like Ubuntu 22.04)
    windows - for Windows
    darwin - for macOS
    freebsd - for FreeBSD

GOOS list 
go tool dist list
