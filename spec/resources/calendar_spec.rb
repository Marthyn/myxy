require 'spec_helper'

describe Myxy::Calendar do
  let(:name) { FFaker::BaconIpsum.word }
  let(:description) { FFaker::BaconIpsum.sentence }
  let(:calendar_type) { ["todo", "normal"].sample }
  let(:calendar_json) {
    '{
      "meta_data": {
        "count": 1
      },
      "data": [
        {
          "id": "ddfa0bbd007f027c3bcbe7d95800292b_14383556686772",
          "calendar_type": "normal"
        }
      ]
    }'
  }

  let(:find_by_calendars_json) {
    '{
      "meta_data": {
        "count": 1
      },
      "data": [
        {
          "id": "ddfa0bbd007f027c3bcbe7d95800292b_14383556686772",
          "calendar_type": "normal"
        },
        {
          "id": "ddfa0bbd007f027c3bcbe7d95800292b_14383556686772",
          "calendar_type": "normal"
        }
      ]
    }'
  }

  it "can initialize" do
    calendar = Myxy::Calendar.new
    expect(calendar).to be_a(Myxy::Calendar)
  end

  it "accepts attribute setter" do
    calendar = Myxy::Calendar.new
    calendar.name = name
    expect(calendar.name).to eq name
  end

  it "returns value for getters" do
    calendar = Myxy::Calendar.new({ description: description })
    expect(calendar.description).to eq description
  end

  it "crashes and burns when getting an unset attribute" do
    calendar = Myxy::Calendar.new({ name: name })
    expect(calendar.try(:not_an_attribute)).to eq nil
  end

  it "is a valid resource" do
    calendar = Myxy::Calendar.new({ calendar_type: calendar_type })
    expect(calendar.valid?).to eq true
  end

  it "cannot be saved" do
    calendar = Myxy::Calendar.new({ name: name })
    expect(calendar.save).to eq false
  end

  it "cannot be deleted" do
    calendar = Myxy::Calendar.new({ name: name })
    expect(calendar.delete).to eq false
  end

  context "Class Methods" do
    it "has a base path" do
      expect(Myxy::Calendar.base_path).to eq("calendars")
    end

    it "can find one" do
      stub_request(:get, "https://beta.calendar42.com/app/django/api/v2/calendars/1/").to_return(body: calendar_json, headers: { content_type: "application/json" })
      expect(Myxy::Calendar.find(1)).to be_a(Myxy::Calendar)
    end

    it "can find many" do
      stub_request(:get, "https://beta.calendar42.com/app/django/api/v2/calendars/").to_return(body: find_by_calendars_json, headers: { content_type: "application/json" })
      expect(Myxy::Calendar.all.length).to eq(2)
    end

    it "can find by a parameter" do
      stub_request(:get, "https://beta.calendar42.com/app/django/api/v2/calendars?length=200/").to_return(body: find_by_calendars_json, headers: { content_type: "application/json" })
      expect(Myxy::Calendar.find_by(length: 200)).to be_a(Myxy::Calendar)
    end

    it "can do a where query" do
      stub_request(:get, "https://beta.calendar42.com/app/django/api/v2/calendars?length=200/").to_return(body: find_by_calendars_json, headers: { content_type: "application/json" })
      expect(Myxy::Calendar.where(length: 200).length).to eq 2
    end
  end
end
