#! /usr/bin/env sh

mydir="$(dirname "$0")"

export GOOS=$GOOS
export GOARCH=$GOARCH
if [ -z "$GOPATH" ]; then
    export GOPATH=$(go env GOPATH)
fi
PWDMINUSGOPATH=$(echo $PWD | sed "s|$GOPATH||")

echo $PWDMINUSGOPATH

docker build -f "$mydir/Dockerfile" -t go-backport:latest "$mydir/../lib/go-backport/"

docker run --rm -v "$GOPATH/src/github.com/eyedeekay/go-I2P-jpackage":"/usr/src/github.com/eyedeekay/go-I2P-jpackage" \
    -v "$PWD":"/usr$PWDMINUSGOPATH" -w "/usr$PWDMINUSGOPATH" -e GOOS="$GOOS" -e GOARCH="$GOARCH" golang:1.18 go $@
