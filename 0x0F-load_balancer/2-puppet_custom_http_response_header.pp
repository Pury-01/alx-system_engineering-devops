# Ensure Nginx is installed
package { 'nginx':
  ensure => installed,
}

# Configure Nginx with custom header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "\
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    
    root /var/www/html;
    index index.html index.htm;
    
    server_name _;
    
    location / {
        add_header X-Served-By $hostname;
        try_files $uri $uri/ =404;
    }
}",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
