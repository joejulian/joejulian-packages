# == Class: packages::python_pip
#
# This class is for installing the python version of pip
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  include python_pip
#
#  ** OR **
#
#  class { packages::python_pip
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
class packages::python_pip (
  $ensure = 'installed'
) {
  case $::operatingsystem {
    rhel, centos, fedora: {
      package { 'python-pip':
        ensure => $ensure,
      }
    }
    default: {
      fail("This operating system is not yet supported.")
    }
  }
}
