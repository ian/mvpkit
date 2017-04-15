require 'test_helper'

module Admin
  class ConversionsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @conversion = admin_conversions(:one)
    end

    test "should get index" do
      get conversions_url
      assert_response :success
    end

    test "should get new" do
      get new_conversion_url
      assert_response :success
    end

    test "should create conversion" do
      assert_difference('Conversion.count') do
        post conversions_url, params: { conversion: { email: @conversion.email } }
      end

      assert_redirected_to conversion_url(Conversion.last)
    end

    test "should show conversion" do
      get conversion_url(@conversion)
      assert_response :success
    end

    test "should get edit" do
      get edit_conversion_url(@conversion)
      assert_response :success
    end

    test "should update conversion" do
      patch conversion_url(@conversion), params: { conversion: { email: @conversion.email } }
      assert_redirected_to conversion_url(@conversion)
    end

    test "should destroy conversion" do
      assert_difference('Conversion.count', -1) do
        delete conversion_url(@conversion)
      end

      assert_redirected_to conversions_url
    end
  end
end
