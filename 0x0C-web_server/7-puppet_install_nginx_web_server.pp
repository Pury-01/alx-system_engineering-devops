# Nginx configuration using puppet

package { 'nginx':
  ensure => installed,
}

file { 'etc/nginx/sites-available/default':
  ensure => 'file',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/@pury8351 permanent;',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package[ 'nginx' ],
}
