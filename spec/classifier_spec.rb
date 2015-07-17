require 'spec_helper'

describe Myxy::Classifier do
  it 'can turn data into a class' do
    klass_name = 'Myxy::Event'
    data = { id: 123, time: DateTime.now }
    object = Myxy::Classifier.parse(data, klass_name)
    expect(object).to be_a(Myxy::Event)
    expect(object.id).to eq(123)
  end

  # it 'doesn\'t burn with an unkown class name' do
  #   klass_name = 'klass_thats_not_defined'
  #   data = { id: 123, name: 'pieter' }
  #   object = Myxy::Classifier.parse(data, klass_name)
  #   expect(object).to be_a(Myxy::KlassThatsNotDefined)
  #   expect(object.id).to eq(123)
  # end
end
