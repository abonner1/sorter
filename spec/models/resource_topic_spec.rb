require 'rails_helper'

RSpec.describe ResourceTopic, type: :model do
  before(:each) do
    @resource = Resource.first
    @topic = Topic.first
  end

  it "belongs to topic" do
    expect(@topic.resources.first).to be_a(Resource)
  end

  it "belongs to resource" do
    expect(@resource.topics.first).to be_a(Topic)
  end

end
