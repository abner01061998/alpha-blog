require "test_helper"

class SignupTest < ActionDispatch::IntegrationTest
  test "should create user and create an article" do
    post users_path, params:{ user: {username:"123", email: "123@test.com" ,password:"123", admin: false}}
    assert_redirected_to user_url(User.last)
    get new_article_path
    post "/articles", params:{ article:{ title: "Hello world", description:"Hello, people are getting hungry", categories:[2,3]}}
    assert_redirected_to article_url(Article.last)
    follow_redirect!
    assert_match "Article was created successfully", response.body  
  end
end
