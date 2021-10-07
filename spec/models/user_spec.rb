require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do 
    @user_without_email = User.new(email: "example1@test.com")
    @user_without_strong_password = User.new(email: "example2@test.com", password: "12345")
    @user_strong_password = User.new(email: "example2@test.com", password: "123456")
    @user_super_admin = User.create!(email: "example3@test.com", password: "123456", superadmin_role: true)
    @user_no_user_role = User.create!(email: "example4@test.com", password: "123456", superadmin_role: true, user_role: false)
  end
  it "has a password empty field" do
    expect(@user_without_email.save).to be_falsey 
  end
  it "has a password with less of 6 characters" do
    expect(@user_without_strong_password.save).to be_falsey 
  end
  it "has a password with 6 characters" do
    expect(@user_strong_password.save).to be_truthy 
  end
  it "has a true user role field by default" do
    expect(@user_strong_password.user_role).to be_truthy 
  end
  it "has a true superadmin user role field" do
    expect(@user_super_admin.superadmin_role).to be_truthy
  end
  it "has a true superadmin user role field and false user role field" do
    expect(@user_no_user_role.user_role).to be_falsey
  end
  
end
