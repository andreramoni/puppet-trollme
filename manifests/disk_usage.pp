# == Class: trollme::disk_usage
#
# === Parameters
# [*usage*]
#   The threshold, in percentage (1-100), that should be enforced.
#
# === Authors
#
# Andre Ramoni
#
define trollme::disk_usage (
    $usage,
    $mountpoint = $title,
) {
  # Check with this:
  #  $us = regsubst($::disk_usage, "(.*)${mountpoint}=([0-9]+)\,(.*)", '\2')

  exec { "disk_usage_${title}":
    command => "/sbin/trollme_disk_usage.sh ${mountpoint} ${usage}",
    require => File['trollme_disk_usage.sh'],
  }
}
