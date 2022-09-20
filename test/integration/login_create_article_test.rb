require "test_helper"

class LoginCreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @admin_user = User.create(username: "jondoe", email: "john@doe.com", password:"123321", admin: true)
    sign_in_as(@admin_user)
  end

  test "should login and create article" do
    get new_article_path
    article = { title:"Hello World", description:"my name is methos", categories: [1,2]}
    post "/articles", params: { article: article }
    follow_redirect!
    assert_match "Article was created successfully", response.body  
    assert_match article[:title], response.body  
  end
end
