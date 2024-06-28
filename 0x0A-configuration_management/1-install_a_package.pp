# Install flask from pip3

package {'python3-pip':
  ensure =>  installed,
}

exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => ['/bin', '/usr/bin', '/usr/local/bin'],
  require => Package['python3-pip'],
}
