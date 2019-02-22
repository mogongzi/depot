require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    assert_routing '/admin', controller: 'admin', action: 'index'
  end
end
