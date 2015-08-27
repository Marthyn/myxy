require 'spec_helper'

describe Myxy::Classifier do
  it 'can turn data into a class' do
    klass_name = 'Myxy::Event'
    data = { id: 123, time: DateTime.now }
    object = Myxy::Classifier.parse(data, klass_name)
    expect(object).to be_a(Myxy::Event)
    expect(object.id).to eq(123)
  end

  it 'doesn\'t crash and burn with an unkown class name' do
    expect(Myxy::Log).to receive(:info).with("Unkown resource found, wrong constant name klass_thats_not_defined")
    klass_name = 'klass_thats_not_defined'
    data = { id: 123, name: 'pieter' }
    object = Myxy::Classifier.parse(data, klass_name)
    expect(object).to eq(false)
  end
end
