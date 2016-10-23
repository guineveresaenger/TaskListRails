require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "Can create a user with valid data" do
    user = users(:grace)
    assert user.valid?
  end

  test "User must have uid" do
    user = User.new(name: "Test", email: "test@test.com", provider: "github")
    assert_not user.valid?

    assert_includes user.errors, :uid
  end

  test "User must have name" do
    user = User.new(uid: 37, email: "test@test.com", provider: "github")
    assert_not user.valid?

    assert_includes user.errors, :name
  end

  test "User must have email" do
    user = User.new(name: "Test", uid: 73, provider: "github")
    assert_not user.valid?

    assert_includes user.errors, :email
  end

  test "User must have provider" do
    user = User.new(name: "Test", email: "test@test.com", uid: 1500)
    assert_not user.valid?
    assert_includes user.errors, :provider
  end

  test "Name must be unique" do
    user1 = users(:grace)
    user2 = User.new(name: "Grace Hopper", email: "test@test.com", uid: 1500, provider: "github")

    assert user1.valid?
    assert_not user2.valid?
  end

  test "Email must be unique" do
    user1 = users(:grace)
    user2 = User.new(name: "Guinevere", email: "grace.hopper@adadevelopersacedemy.org", uid: 1500, provider: "github")

    assert user1.valid?
    assert_not user2.valid?
  end

end
