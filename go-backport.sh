#! /usr/bin/env sh

mydir="$(dirname "$0")"

export GOOS=$GOOS
export GOARCH=$GOARCH
export CGO_ENABLED=$CGO_ENABLED
if [ -z "$GOPATH" ]; then
    export GOPATH=$(go env GOPATH)
fi
PWDMINUSGOPATH=$(echo $PWD | sed "s|$GOPATH||")

echo $PWDMINUSGOPATH

docker build -f "$mydir/../lib/go-backport/Dockerfile" -t go-backport:latest "$mydir/../lib/go-backport/"

docker run --rm \
    -v "$GOPATH/src/github.com/eyedeekay/go-I2P-jpackage":"/usr/src/github.com/eyedeekay/go-I2P-jpackage" \
    -v "$PWD":"/usr$PWDMINUSGOPATH" \
    -w "/usr$PWDMINUSGOPATH" \
    -e GOOS="$GOOS" \
    -e GOARCH="$GOARCH" \
    -e CGO_ENABLED="$CGO_ENABLED" \
    -e GO111MODULE="$GO111MODULE" \
    -e GOARCH="$GOARCH" \
    -e GOCACHE="$GOCACHE" \
    -e GONOPROXY="$GONOPROXY" \
    -e GONOSUMDB="$GONOSUMDB" \
    -e GOPROXY="$GOPROXY" \
    -e GOSUMDB="$GOSUMDB" \
    -e GOVCS="$GOVCS" \
    -e AR="$AR" \
    -e CC="$CC" \
    -e CXX="$CXX" \
    -e GOMOD="$GOMOD" \
    -e GOWORK="$GOWORK" \
    -e CGO_CFLAGS="$CGO_CFLAGS" \
    -e CGO_CPPFLAGS="$CGO_CPPFLAGS" \
    -e CGO_CXXFLAGS="$CGO_CXXFLAGS" \
    -e CGO_FFLAGS="$CGO_FFLAGS" \
    -e CGO_LDFLAGS="$CGO_LDFLAGS" \
    -e PKG_CONFIG="$PKG_CONFIG" \
    -e GOGCCFLAGS="$GOGCCFLAGS" \
    go-backport:latest go "$@"
