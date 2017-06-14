require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.first
  end

  describe "username" do
    it "is unique" do
      User.create(
            name: "Avi",
            username: "aviflombaum",
            email: "aviflombaum2@flatiron.com",
            password: "password")
      expect(User.where(username: "aviflombaum").count).to eq(1)
    end

    it "validates user when present" do
      @user.username = nil
      expect(@user).not_to be_valid
    end
  end

  it "has many resources" do
    expect(@user.resources.count).to eq(1)
  end
end
