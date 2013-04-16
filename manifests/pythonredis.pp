# == Class: packages::pythonredis
#
# This class is for installing the redis library for python
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  include pythonredis
#
#  ** OR **
#
#  class { packages::pythonredis
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
class packages::pythonredis (
  ensure => "2.4.11"
) {
case $::operatingsystem {
  rhel, centos: {
    include packages::python_pip

    package { "python-redis":
      provider => "pip",
      name     => "redis",
      ensure   => $ensure,
      require  => Package['python-pip'],
    }
  }
  fedora: {
    include packages::python_pip
    package { "python-redis":
      ensure  => $ensure,
      require => Package['python-pip'],
    }
  }
  default: {
    fail("This operating system is not yet supported.")
  }
}
