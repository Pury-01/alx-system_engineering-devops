# Firewall
This project installs ufw firewall on web-01
It configures ufw so that it blocks all incoming traffic except from TCP ports:
	22 (SSH)
	443 (HTTPS SSL)
	80 (HTTP)

It also configures web-01 so that its firewall redirects port 8080/TCP to port 80/TCP
