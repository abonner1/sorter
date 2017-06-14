require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.first
  end

  it "has many resources" do
    expect(@user.resources.count).to eq(1)
  end
end
