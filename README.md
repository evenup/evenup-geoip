What is it?
===========

Puppet module to install geoip data files from [MaxMind](http://www.maxmind.com/en/geolocation_landing).

MaxMind's downloadable data does not appear to be versioned and since puppet
cannot determine whether a file has been changed via http this module requires
a copy of the desired data set to be provided and versioned on a local web 
server.  This module looks for files in the form of <filename>-<version> in
the $source location.

Each data file can have its source and version definied individually or they
can be defined globally by setting version and source as class parameters.
 
Usage:
------

Global definitions:
<pre>
  class { geoip:
    source  => 'http://myserver.example.com/geoip/,
    version => '20130402'
  }
  
  geoip::file { 'GeoCityLite.dat': }
  geoip::file { 'GeoIp.dat': }
</pre>

Per file definition:
<pre>
  geoip::file { 'GeoCityLite.dat':
    source  => 'http://myserver.example.com/geoip/city/',
    version => '20120101'
  }
  
  geoip::file { 'GeoIp.dat':
    source  => 'http://bobshome.example.com/~bob/,
    version => '1.2-pre3'
  }
</pre>

License:
--------
Released under the Apache 2.0 licence

Contribute:
-----------
* Fork it
* Create a topic branch
* Improve/fix (with spec tests)
* Push new topic branch
* Submit a PR
