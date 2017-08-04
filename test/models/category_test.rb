require 'test_helper.rb'

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.new(name: "sports")
    end

    test "categories should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end
end