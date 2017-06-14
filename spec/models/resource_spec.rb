require 'rails_helper'

RSpec.describe Resource, type: :model do
  let(:resource) do
    Resource.new(
        title: "Active Record Associations",
        url: "http://guides.rubyonrails.org/association_basics.html",
        description: "This is a resource!",
        user_id: User.first.id,
        language_id: Language.first.id)
  end

  describe "attributes" do
    it "validates with a title and a url" do
      expect(resource).to be_valid
    end

    it "does not validate without a title or a url" do
      resource.title = nil
      resource.url = nil
      expect(resource).not_to be_valid
    end

    it "has a description" do
      expect(resource.description).to eq("This is a resource!")
    end

    it "validates with a language_id and a user_id" do
      expect(resource).to be_valid
    end

    it "does not validate without a language_id or a user_id" do
      resource.language_id = nil
      resource.user_id = nil
      expect(resource).not_to be_valid
    end

  end

end
