work:
	reset
	podman-compose build
	podman-compose up
clean:
	make flush
	reset
	podman-compose build --no-cache
	podman-compose up
terminal:
	podman exec -it "$$(podman ps -q -f name=kali)" /bin/bash
flush:
	podman stop -a -i
	podman rm -a -f
	podman system prune -a -f
	podman image prune -a -f
	podman volume rm -a -f
	podman volume prune -f
