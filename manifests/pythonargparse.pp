# == Class: packages::pythonargparse
#
# This class is for installing the argparse python library
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package
#
#
# === Examples
#
#  include packages::pythonargparse
#
#  ** OR **
#
#  class { packages::pythonargparse
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
class packages::pythonargparse (
  $ensure = 'installed'
) {
  case $::operatingsystem {
    rhel, centos, fedora: {
      if ( $operatingsystem == "Fedora" and $operatingsystemrelease > 17 ) {
        $repo_required = "base"
        } else {
          include yum::supplemental::epel
          $repo_required = "epel"
        }

        package {'python-argparse':
          ensure  => $ensure,
          require => Yumrepo[$repo_required],
        }
    }
    default: {
      fail("This operating system is not yet supported.")
    }
  }
}
