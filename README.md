# go-backport

Builds Go executables with a very new Go version and a very old libc using docker.
This is basically just a small extension of the official golang-go 1.18 docker
image of Debian buster, which adds in libraries that I use a lot and a wrapper script
to keep it compatible with my existing builds. I'll add support for passing more
environment variables through to the docker container as needed. The wrapper script
works pretty much exactly like the `go` executable in most respects and is intended
to be dropped into the `$PATH` ahead of `go` so my releases get fully built.
