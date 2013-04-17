# == Class: packages::pythonordereddict
#
# This class is for installing the ordered dict library for python
#
# === Parameters
#
# [*ensure*] Same as the native puppet type: package::pythonordereddict
#
#
# === Examples
#
#  include packages::pythonordereddict
#
#  ** OR **
#
#  class { packages::pythonordereddict
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
class packages::pythonordereddict (
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

        package {'python-ordereddict':
          ensure  => $ensure,
          require => Yumrepo[$repo_required],
        }
    }
    default: {
      fail("This operating system is not yet supported.")
    }
  }
}
