#/bin/bash!

while [ 1 ] ; do inotifywait -r -t 1 /root/gmananth/watch/ -e create -e open -e attrib | while read path action file; do echo "The file '$file' operation in directory '$path' via '$action'"; done; sleep 1; done

