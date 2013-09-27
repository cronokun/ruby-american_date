require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))), 'lib', 'american_date')
require 'time'
require 'active_support/core_ext/time/zones'

describe 'Time.zone.parse' do
  before do
    Time.zone = 'Pacific Time (US & Canada)'
  end

  it 'competes year for short american date format mm/dd/yy' do
    parsed_date = Time.zone.parse('09/27/13')
    expect(parsed_date).to eq Time.zone.local(2013, 9, 27)
  end

  it 'competes year for short american date format m/d/yy' do
    parsed_date = Time.zone.parse('9/7/13')
    expect(parsed_date).to eq Time.zone.local(2013, 9, 7)
  end

  it "it doesn't complete year for ISO date format yyyy-mm-dd" do
    parsed_date = Time.zone.parse('13-09-27')
    expect(parsed_date).to eq Time.zone.local(13, 9, 27)
  end
end
