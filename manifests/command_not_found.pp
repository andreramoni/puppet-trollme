# == Class: trollme::command_not_found
#
# You should know your system.
# Evertytime you type a command that does not exists, something bad will happen.
#
# === Parameters
#
# What to do.
# Supported options:
#
# [*action*]
# - remove_random_file: removes a random file.
# - sl: classical sl command (ls done wrong).
#
# === Examples
#
#  class { 'trollme::command_not_found':
#    action => 'remove_random_file',
#  }
#
# === Authors
#
# Andre Ramoni
#
class trollme::command_not_found (
  $cnf_action = $::trollme::params::cnf_action,
  $cnf_file   = $::trollme::params::cnf_file,
  $sl_pkg     = $::trollme::params::sl_pkg,
) inherits trollme::params {
  file { $cnf_file:
    ensure  => file,
    mode    => '0755',
    content => template("trollme/cnf/${cnf_action}.erb"),
  }

  if $cnf_action == 'sl' {
    package { $sl_pkg:
      ensure => installed,
    }
  }

}
