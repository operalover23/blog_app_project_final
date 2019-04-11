require "test_helper"
class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "food")
  end

  test "category should validate" do
    assert @category.valid?
  end

  test "name present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "unique name" do
    @category.save
    category2 = Category.new(name: "food")
    assert_not category2.valid?
  end

  test "name should not be long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be short" do
    @category.name = "a"
    assert_not @category.valid?
  end
end
