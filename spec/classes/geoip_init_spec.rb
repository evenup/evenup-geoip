require 'spec_helper'
 
describe 'geoip', :type => :class do

  it { should create_class('geoip') }
  
  context 'default path' do
    it { should contain_file('/usr/local/share/geoip').with_ensure('directory') }
  end
  
  context 'updated path' do
    let(:params) { { :path => '/somewhere' } }
    it { should contain_file('/somewhere').with_ensure('directory') }
  end

end
