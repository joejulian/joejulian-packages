# == Class: packages::beaver
#
# This class is for installing beaver
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  incldue packages::beaver
#
#  ** OR **
#
#  class { packages::beaver
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
class packages::beaver (
  $ensure = 'installed'
) {
  case $::operatingsystem {
    rhel, centos, fedora: {
      include packages::python_pip
      include packages::git
      include packages::pythonsimplejson
      include packages::pythonargparse
      include packages::pythonpika
      include packages::pythonredis
      include packages::pythonordereddict
      include packages::pythondaemon
      package { "Beaver":
        provider => "pip",
        ensure   => installed,
        source   => "git+git://github.com/josegonzalez/beaver.git#egg=beaver",
        require  => [ 
          Package['python-pip'],
          Package['git'],
          Package['python-simplejson'],
          Package['python-argparse'],
          Package['python-pika'],
          Package['python-redis'],
          Package['python-ordereddict'],
          Package['python-daemon'],
        ],
      }
    }
    default: {
      fail("This operating system is not yet supported.")
    }
  }
}
