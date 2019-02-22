require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_index_url
  end
end
