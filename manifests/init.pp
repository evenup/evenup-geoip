# == Class: geoip
#
# This class manges the local installation of GeoIp data from MaxMind
# (http://www.maxmind.com/en/geolocation_landing).  It does not automatically
# fetch them from MaxMind (since they don't expose versioning) but rather
# relies on having a copy on a local http server.
#
# === Parameters
#
# [*path*]
#   String.  Location GeoIp data files should be installed to
#   Default: /usr/local/share/geoip
#
# [*source*]
#   String.  The root location that contains the geoip data files
#
# [*version*]
#   String.  Version number appended to the geoip data file
#
# === Examples
#
#   In Hiera config:
#     geoip::source: http://myserver.example.com/geoip
#
#   In node/module:
#   geoip::file { 'GeoLiteCity.dat':
#     version => '20130402'
#   }
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
# === Copyright
#
# Copyright 2013 EvenUp.
#
class geoip (
  $path     = '/usr/local/share/geoip',
  $source   = '',
  $version  = '',
) {

  file { $path:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0555',
  }

}