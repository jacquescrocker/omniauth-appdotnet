require 'spec_helper'

describe OmniAuth::Strategies::AppDotNet do
  subject do
    OmniAuth::Strategies::AppDotNet.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("appdotnet")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://alpha-api.app.net/')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://alpha.app.net/oauth/authenticate')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://alpha.app.net/oauth/access_token')
    end
  end
end
