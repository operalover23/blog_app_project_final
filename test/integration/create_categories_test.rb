require "test_helper"
class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = USer.create(username: "elizabeth", email: "elizabeth@email.com", password: "password", admin: true)
  end

  test "get new form for create category and new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template "categories/new"
    assert_difference "Category.count", 1 do
      post categories_path, params: { category: { name: "food" } }
      follow_redirect!
    end
    assert_template "categories/index"
    assert_match "food", response.body
  end

  test "invalid category" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template "categories/new"
    assert_no_difference "Category.count" do
      post categories_path, params: { category: {name: " "} }
    end
    assert_template "categories/new"
    assert_select "h2.panel-title"
    assert_select "div.panel-body"
  end
end
