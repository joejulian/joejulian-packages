# == Class: packages::ujson
#
# This class is for installing the ujson library for python
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  include packages::ujson
#
#  ** OR **
#
#  class { packages::ujson
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
class packages::ujson (
  $ensure = 'installed'
) {
  case $::operatingsystem {
    rhel, centos: {
      include yum::supplemental::ewcs
      package { 'python-ujson':
        ensure  => $ensure,
        require => Yumrepo['ewcs'],
      }
    }
    fedora: {
      package { 'python-ujson':
        ensure  => $ensure,
      }
    }
    default: {
      fail("This operating system is not yet supported.")
    }
  }
}
