require "test_helper"

=begin

  What's being tested here?

    - Typus::Controller::Format

=end

class Admin::EntriesControllerTest < ActionController::TestCase

  setup do
    @request.session[:typus_user_id] = FactoryGirl.create(:typus_user).id
  end

  test "export csv" do
    Entry.delete_all
    entry = FactoryGirl.create(:entry)

    expected = <<-RAW
title,published
#{entry.title},#{entry.published}
     RAW

    get :index, :format => "csv"

    assert_response :success
    assert_equal expected, @response.body
  end

  test "export XML" do
    get :index, :format => "xml"
    assert_response :unprocessable_entity
  end

end
