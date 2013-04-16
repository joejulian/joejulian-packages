# == Class: packages::pythonpika
#
# This class is for installing the pika libarary for python
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  include packages::pythonpika
#
#  ** OR **
#
#  class { packages::pythonpika
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
class packages::pythonpika (
  ensure => installed
) {
case $::operatingsystem {
  rhel, centos, fedora: {
    if ( $operatingsystem == "Fedora" and $operatingsystemrelease > 17 ) {
      $repo_required = "base"
    } else {
      include yum::supplemental::epel
      $repo_required = "epel"
    }

    package {'python-pika':
      ensure  => $ensure,
      require => Yumrepo[$repo_required],
    }
  }
  default: {
    fail("This operating system is not yet supported.")
  }
}
