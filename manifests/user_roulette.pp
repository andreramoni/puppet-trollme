# == Class: trollme::user_roulette
#
# This is how we play russian roulette now !
# This class removes a random user from the system.
#
# Since it does not make any sense to a config mgmt 
# tool to make something random, we put the random logic
# on a custom fact.
# This also brings the possibility to see wich user WOULD
# be deleted if puppet runs this class in that momment !
#
# === Parameters
#
# [*whitelist*]
#
# === Examples
#
#  class { 'trollme::user_roulette':
#  }
#
# === Authors
#
# Andre Ramoni
#
class trollme::user_roulette {
  notify { "Removing ${::user_roulette}" }
#  user { $user_roulette:
#    ensure => absent,
#  }
}
