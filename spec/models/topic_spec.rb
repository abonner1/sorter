require 'rails_helper'

RSpec.describe Topic, type: :model do
  before(:each) do
    @topic = Topic.first
  end

  it "it validates with presence of name" do
    expect(@topic).to be_valid
  end

  it "does not validate if there is no name" do
    @topic.name = nil
    expect(@topic).not_to be_valid
  end

  it "has many resources" do
    @topic.resources.build
    expect(@topic.resources.count).to eq(1)
  end

end
