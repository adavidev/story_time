require 'spec_helper'

describe PresentReplacer do
  before :each do
    @pf = PresentReplacer.new
    @ps = "I eat an apple"
  end

  it 'should find the present tense verb' do
    expect(@pf.find(@ps)).to eq("eat")
  end

end
