# == Class: trollme::disk_usage
#
# === Parameters
# [*usage*]
#   The threshold, in percentage (1-100), that should be enforced.
#
# === Authors
#
# Author Name <author@domain.com>
#
define trollme::disk_usage (
    $usage,
    $mountpoint = $title,
) {
  exec { "disk_usage_${title}":
    command => "/sbin/trollme_disk_usage.sh ${mountpoint} ${usage}",
    require => File['trollme_disk_usage.sh'],
  }
}
