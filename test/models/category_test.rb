require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    
    def setup
        @category = Category.new
    end

    test "category should be valid" do
        @category.name = "sports 1"
        assert @category.valid?
    end

    test "name should be present" do 
        @category.name = ""
        assert_not @category.valid?
    end

    test "name should be unique" do 
        @category = Category.new(name: "sports 1")
        @category.save
        @category2 = Category.new(name: "sports 1")
        assert_not @category2.valid?
    end

    test "name should be not too long" do 
        @category.name = "a" * 27
        assert_not @category.valid?
    end

    test "name should be not too short" do 
        @category.name = "aa"
        assert_not @category.valid?
    end
end