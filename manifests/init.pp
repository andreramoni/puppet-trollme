# == Class: trollme
#
# This class does nothing.
#
class trollme (
  $locate_pkg = $::trollme::params::locate_pkg,
  $locate_db = $::trollme::params::locate_db,
  $locate_cmd = $::trollme::params::locate_cmd,
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
    command => $locate_cmd,
    creates => $locate_db,
    require => Package[$locate_pkg]
  }

  #
  file { 'trollme_disk_usage.sh':
    ensure => file,
    path   => '/sbin/trollme_disk_usage.sh',
    mode   => '0755',
    source => 'puppet:///modules/trollme/disk_usage/trollme_disk_usage.sh',
  }

}
