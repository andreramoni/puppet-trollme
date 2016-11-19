# == Class: trollme
#
# This class does nothing.
#
class trollme {
  if  ($::osfamily != 'Debian')
  and ($::osfamily != 'RedHat') {
    fail("Module ${module_name} does not support ${::osfamily}.")
  }

}
