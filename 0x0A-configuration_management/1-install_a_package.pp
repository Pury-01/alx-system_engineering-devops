# Install flask from pip3

package { 'python3':
  ensure =>  installed,
}

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask_and_werkzeug':
  command => '/usr/bin/pip3 install Flask==2.1.0 Werkzeug==2.0.3',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Package['python3-pip'],
}
