#!/usr/bin/env bash
# use of puppet make changes to configuration file

file { '/etc/ssh/ssh_config':
  ensure => present,

content  =>"
   # client config
   host*
   IdentityFile ~/.ssh/school
   PasswordAuthentication no
   ",
}
