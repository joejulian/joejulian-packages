# == Class: packages::nginx_passenger
#
# This class is for installing passenger for nginx
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  include packages::nginx_passenger
#
#  ** OR **
#
#  class { packages::nginx_passenger
#    ensure => 'installed',
#  }
#
# === Authors
#
# Joe Julian <me@joejulian.name>
#
# === Copyright
#
# Copyright 2013 Joe Julian
#
class packages::nginx_passenger (
  ensure => installed
) {
case $::operatingsystem {
  rhel, centos: {
    include yum::supplemental::phusion
    package { 'nginx-passenger':
      ensure  => $ensure,
      require => Yumrepo['phusion'],
    }
  }
  default: {
    fail("This operating system is not yet supported.")
  }
}
