# == Define: geoip::file
#
# This define manages individual database files and versions from an HTTP server.
#
# === Parameters
#
# [*source*]
#   String.  The root location that contains the geoip data files
#
# [*version*]
#   String.  Version number appended to the geoip data file
#
# === Examples
#
#   geoip::file { 'GeoLiteCity.dat':
#     source  => 'http://myserver.example.com/geoip/'
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
define geoip::file (
  $source   = undef,
  $version  = undef,
){

  include ::geoip

  if !$source {
    if !$::geoip::source {
      alert("GeoIP source not set for geoip::file{${name}}")
    } else {
      $source_real = $::geoip::source
    }
  } else {
    $source_real = $source
  }

  if !$version {
    if !$::geoip::version {
      alert("GeoIP version not set for geoip::file{${name}}")
    } else {
      $version_real = $geoip::version
    }
  } else {
    $version_real = $version
  }

  exec { "fetch_geoip_${name}-${version_real}":
    command => "/usr/bin/curl -o ${geoip::path}/${name}-${version_real} ${source_real}/${name}-${version_real}",
    creates => "${geoip::path}/${name}-${version_real}",
    require => Class['geoip'],
  }

  file { "${geoip::path}/${name}-${version_real}":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    require => Exec["fetch_geoip_${name}-${version_real}"],
  }

  file { "${geoip::path}/${name}":
    ensure  => 'link',
    target  => "${geoip::path}/${name}-${version_real}",
    require => File["${geoip::path}/${name}-${version_real}"],
  }
}
