# == Class: packages::git
#
# This class is for installing git
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  incldue packages::git
#
#  ** OR **
#
#  class { packages::git
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
class packages::git (
  $ensure = 'installed'
) {
  case $::operatingsystem {
    rhel, centos, fedora: {
      package { 'git':
        ensure => $ensure,
      }
    }
    default: {
      fail("This operating system is not yet supported.")
    }
  }
}
