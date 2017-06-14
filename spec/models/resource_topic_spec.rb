require 'rails_helper'

RSpec.describe ResourceTopic, type: :model do
  before(:each) do
    @resource = Resource.first
    @topic = Topic.first
    @resource_topic = ResourceTopic.create(resource_id: @resource.id, topic_id: @topic.id)
  end

  it "belongs to topic" do
    expect(@resource_topic.resource).to be_a(Resource)
  end

  it "belongs to resource" do
    expect(@resource_topic.topic).to be_a(Topic)
  end

end
