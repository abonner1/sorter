require 'rails_helper'

RSpec.describe Language, type: :model do
  before(:each) do
    @language = Language.first
  end

  it "validates with a name" do
    expect(@language).to be_valid
  end

  it "does not validate without a name" do
    @language.name = nil
    expect(@language).not_to be_valid
  end

  it "has many resources" do
    @language.resources << Resource.first
    expect(@language.resources.count).to eq(1)
  end

end
