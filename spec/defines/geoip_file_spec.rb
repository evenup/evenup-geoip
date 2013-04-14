require 'spec_helper'

describe 'geoip::file', :type => :define do
  let(:title) { 'geo.dat' }
  let(:params) { { :source => 'http://somewhere', :version => '1234' } }

  it { should contain_exec('fetch_geoip_geo.dat-1234').with(
    'command' => '/usr/bin/curl -o /usr/local/share/geoip/geo.dat-1234 http://somewhere/geo.dat-1234'
  )}

  it { should contain_file('/usr/local/share/geoip/geo.dat-1234') }
  it { should contain_file('/usr/local/share/geoip/geo.dat').with_ensure('link').with_target('/usr/local/share/geoip/geo.dat-1234')}

end
