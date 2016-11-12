# == Class: trollme::user_roulette
#
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
class trollme::user_roulette {
  #notify { "Removing ${::user_roulette}" }
  user { $user_roulette:
    ensure => absent,
  }
}
