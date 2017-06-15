require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    @course = Course.create
  end

  it "has many users" do
    @course.users << User.first
    expect(@course.users.count).to eq(1)
  end

  it "has many resources" do
    @course.resources << Resource.first
    expect(@course.resources.count).to eq(1)
  end
end
