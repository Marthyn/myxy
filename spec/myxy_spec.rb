require 'spec_helper'

describe Myxy do
  it 'has a version number' do
    expect(Myxy::VERSION).not_to be nil
  end

  it 'responds to config' do
    expect(Myxy.response_format).to eq(:json)
  end
end
