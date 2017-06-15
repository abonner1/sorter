require 'rails_helper'

RSpec.describe Resource, type: :model do
  before(:each) do
    @resource = Resource.first
  end

  describe "attributes" do
    it "validates with a title and a url" do
      expect(@resource).to be_valid
    end

    it "does not validate without a title or a url" do
      @resource.title = nil
      @resource.url = nil
      expect(@resource).not_to be_valid
    end

    it "has a description" do
      expect(@resource.description).to eq("This is a resource!")
    end

    it "validates with a language_id and a user_id" do
      expect(@resource).to be_valid
    end

    it "does not validate without a language_id or a user_id" do
      @resource.language_id = nil
      @resource.user_id = nil
      expect(@resource).not_to be_valid
    end
  end

  describe "assocations" do
    it "has many topics" do
      expect(@resource.topics.count).to eq(1)
    end

    it "belongs to a user" do
      expect(@resource.user).to be_a(User)
    end

    it "belongs to a language" do
      expect(@resource.language).to be_a(Language)
    end

    it "has courses" do
      @resource.courses.create
      expect(@resource.courses.count).to eq(1)
    end
  end

end
