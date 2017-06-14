require 'rails_helper'

RSpec.describe Language, type: :model do
  let(:language) do
    Language.create(name: "Ruby")
  end

  it "validates with a name" do
    expect(language).to be_valid
  end

  it "does not validate without a name" do
    language.name = nil
    expect(language).not_to be_valid
  end

  it "has many resources" do
    language.resources.build
    expect(language.resources.count).to eq(1)
  end

end
