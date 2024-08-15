# Using strace to find out why Apache is returning error 500, fixing it and automate it usiing Puppet

exec {'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
