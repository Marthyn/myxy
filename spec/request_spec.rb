require 'spec_helper'

describe Myxy::Request do
  it 'can do a GET request' do
    stub_request(:get, "https://beta.calendar42.com/app/django/api/v2/nothing")
    expect(Myxy.get('nothing')).to be_a Myxy::Response
  end

  it 'can do a POST request' do
    stub_request(:post, "https://beta.calendar42.com/app/django/api/v2/nothing")
    expect(Myxy.post('nothing', { nothing: "Nothing" })).to be_a Myxy::Response
  end

  it 'can do a PUT request' do
    stub_request(:put, "https://beta.calendar42.com/app/django/api/v2/nothing/23")
    expect(Myxy.put('nothing/23')).to be_a Myxy::Response
  end

  it 'can do a PUT request' do
    stub_request(:delete, "https://beta.calendar42.com/app/django/api/v2/nothing/23")
    expect(Myxy.delete('nothing/23')).to be_a Myxy::Response
  end
end
