# == Resource: trollme::roulette
#
# How lucky do you feel today ?
# This class removes a random file or user (root included) from the system.
#
# Since it does not make any sense to a config mgmt
# tool to make something random, we put the random logic
# on a custom fact, $::roulette_<target>.
#
# === Parameters
#
# [*target*]
#   The target type of the roulette.
#   Available options: file, user, command.
#   Default: from title.
#
# [*time_range*]
#   The schedule range parameter.
#   Example: 'HH:MM - HH:MM'.
#   Default: '00:00 - 23:59'.
#
# [*repeat*]
#   The schedule repeat parameter.
#   How many times in period it should be applied.
#   Default: 1
#
# [*period*]
#   The schedule period parameter.
#   Default: daily
#
# [*whitelist*]
#   Not implemented yet.
#   Does not make any sense to implement it since it takes out all the fun.
#
# === Examples
#
#  trollme::roulette { 'file': }
#
#  trollme::roulette { 'user':
#    time_range => '03:00 - 05:00',
#    repeat     => 3,
#  }
#
# === Authors
#
# Andre Ramoni
# Fernando Oliveira
#
define trollme::roulette (
  $target     = $title,
  $window     = $title,
  $time_range = '00:00 - 23:59',
  $period     = 'daily',
  $repeat     = '1',
) {
  case $target {
    'user': {
      user { 'user_roulette':
        ensure   => absent,
        name     => $::roulette_user,
        schedule => $window,
      }
    }
    'file': {
      file { 'file_roulette':
        ensure   => absent,
        path     => $::roulette_file,
        backup   => false,
        schedule => $window,
      }
    }
    'command': {
      file { 'command_roulette':
        ensure   => absent,
        path     => $::roulette_file_frompath,
        backup   => false,
        schedule => $window,
      }
    }
    default: {
      fail("Trollme::roulette does not suport ${target} (yet).")
    }
  }

  schedule { $window:
    range  => $time_range,
    period => $period,
    repeat => $repeat,
  }

}
