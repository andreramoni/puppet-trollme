require 'spec_helper'
describe 'trollme' do

  context 'with defaults for all parameters' do
    it { should contain_class('trollme') }
  end
end
