require 'test_helper'

class BookPolicyTest < ActiveSupport::TestCase
  def test_scope
  end

  def test_show
  end

  def test_create
  end

  def test_update
  end

  def test_destroy
    admin = User.new(admin: true)
    normal_user = User.new(admin: false)
    
    book = Book.new

    assert BookPolicy.new(admin, book).destroy?
    assert_not BookPolicy.new(normal_user, book).destroy?
  end
end
