# == Class: trollme::disk_usage
#
# === Parameters
# [*ensure*]
#   The threshold, in percentage (1-100), that should be enforced.
#
# [*tolerance*]
#   The margin from the desired percentage that will not trigger an action.
#
# === Authors
#
# Andre Ramoni
#
define trollme::disk_usage (
    $ensure,
    $mountpoint = $title,
    $tolerance = 0,
) {
  require trollme
  # Check with this:
  $us = regsubst($::disk_usage, "(.*)${mountpoint}=([0-9]+),(.*)", '\2')
  if ( $us > $ensure + $tolerance )
  or ( $us < $ensure - $tolerance ) {
    exec { "disk_usage_${title}":
      command => "/sbin/trollme_disk_usage.sh ${mountpoint} ${ensure}",
      require => File['trollme_disk_usage.sh'],
    }
  }
}
