require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get title:string" do
    get documents_title:string_url
    assert_response :success
  end

  test "should get content:text" do
    get documents_content:text_url
    assert_response :success
  end

end
