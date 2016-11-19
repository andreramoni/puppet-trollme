# == Class: trollme
#
# This class does nothing.
#
class trollme (
  $locate_pkg = $::trollme::params::locate_pkg,
  $locate_db = $::trollme::params::locate_db,
) inherits trollme::params {
  if  ($::osfamily != 'Debian')
  and ($::osfamily != 'RedHat') {
    fail("Module ${module_name} does not support ${::osfamily}.")
  }

  # locate must be installed for roulette facts to work.
  package { $locate_pkg:
    ensure => 'installed',
  }
  exec { 'locatedb':
    command => '/bin/updatedb',
    creates => $locate_db,
    require => Package[$locate_pkg]
  }

}
