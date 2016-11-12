# == Resource: trollme::roulette
#
# How lucky do you feel today ?
# This class removes a random user from the system.
# Root included.
#
# Since it does not make any sense to a config mgmt 
# tool to make something random, we put the random logic
# on a custom fact, $::user_roulette.
# The fact uses this command to select a victim:
#   cat /etc/passwd | shuf -n 1 | cut -d: -f1
#
# === Parameters
#
# [*whitelist*]
#   Not implemented yet.
#   
# === Examples
#
#  class { 'trollme::user_roulette': }
#
# === Authors
#
# Andre Ramoni
# Fernando Oliveira
#
#
define trollme::roulette (
  $target,
  $time_range = "00:00 - 23:59",
  $period = 'daily',
  $repeat = '1',
) {

  case $target {
    'user': {
      user { $::roulette_user: ensure => absent, schedule => $window }
    }
    'file': {
      file { $::roulette_file: ensure => absent, schedule => $window }
    }
    default: {
      fail("Trollme::roulette does not suport ${target} (yet).")
    }
  }

  schedule { 'roulette_window':
    range  => $time_range,
    period => $period,
    repeat => $repeat,
  }

}
