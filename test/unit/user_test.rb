require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user must have a name" do
    user = FactoryGirl.build(:user)
    user.name = nil
    refute user.valid?
  end

  test "user must have an email" do
    user = FactoryGirl.build(:user)
    user.email = nil
    refute user.valid?
  end

  test "cannot change the password digest" do
    user = FactoryGirl.create(:user)
    # user.password_digest = "abc123"

    assert_raise(ActiveModel::MassAssignmentSecurity::Error) do
      user.update_attributes(:password_digest => "abc123")
    end
  end

  # test "user must have an password" do
  #   user = FactoryGirl.build(:user)
  #   user.password = nil
  #   refute user.valid?
  # end
end
