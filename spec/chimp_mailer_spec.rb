require 'spec_helper'

describe 'MailChimp' do
  it 'should perform an API call' do
    RestClient.expects(:get).with('http://us1.api.mailchimp.com/1.2/?cid=afd3245&method=campaignSchedule&output=json&schedule_time=2010-06-21+12%3A30%3A00', :accept => :json).once.returns(true)
    MailChimp.campaign_schedule(:cid => 'afd3245', :schedule_time => '2010-06-21 12:30:00')
  end
end
