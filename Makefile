
install:
	mkdir -p /usr/local/lib/go-backport/
	cp Dockerfile /usr/local/lib/go-backport/Dockerfile
	install -m755 go-backport.sh /usr/local/bin/go

