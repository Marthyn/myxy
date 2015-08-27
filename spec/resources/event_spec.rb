require 'spec_helper'

describe Myxy::Event do
  let(:title) { FFaker::BaconIpsum.word }
  let(:description) { FFaker::BaconIpsum.sentence }
  let(:event_type) { ["todo", "normal"].sample }
  let(:event_json) {
    '{
      "meta_data": {
        "count": 1
      },
      "data": [
        {
          "id": "ddfa0bbd007f027c3bcbe7d95800292b_14383556686772",
          "event_type": "normal"
        }
      ]
    }'
  }

  let(:find_by_events_json) {
    '{
      "meta_data": {
        "count": 1
      },
      "data": [
        {
          "id": "ddfa0bbd007f027c3bcbe7d95800292b_14383556686772",
          "event_type": "normal"
        },
        {
          "id": "ddfa0bbd007f027c3bcbe7d95800292b_14383556686772",
          "event_type": "normal"
        }
      ]
    }'
  }

  it "can initialize" do
    event = Myxy::Event.new
    expect(event).to be_a(Myxy::Event)
  end

  it "accepts attribute setter" do
    event = Myxy::Event.new
    event.title = title
    expect(event.title).to eq title
  end

  it "returns value for getters" do
    event = Myxy::Event.new({ description: description })
    expect(event.description).to eq description
  end

  it "crashes and burns when getting an unset attribute" do
    event = Myxy::Event.new({ title: title })
    expect(event.try(:not_an_attribute)).to eq nil
  end

  it "is a valid resource" do
    event = Myxy::Event.new({ event_type: event_type })
    expect(event.valid?).to eq true
  end

  it "is not a valid resource" do
    event = Myxy::Event.new({ title: title })
    expect(event.valid?).to eq false
  end

  context "Class Methods" do
    it "has a base path" do
      expect(Myxy::Event.base_path).to eq("events")
    end

    it "can find one" do
      stub_request(:get, "https://beta.calendar42.com/app/django/api/v2/events/1/").to_return(body: event_json, headers: { content_type: "application/json" })
      expect(Myxy::Event.find(1)).to be_a(Myxy::Event)
    end

    it "can find many" do

    end

    it "can find by a parameter" do
      stub_request(:get, "https://beta.calendar42.com/app/django/api/v2/events?length=200/").to_return(body: find_by_events_json, headers: { content_type: "application/json" })
      expect(Myxy::Event.find_by(length: 200)).to be_a(Myxy::Event)
    end
  end
end
