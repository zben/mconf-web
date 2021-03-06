require "spec_helper"

describe FrontpageController do
  include ActionController::AuthenticationTestHelper
  
  render_views

  describe "when Anonymous" do
    it "should render index" do
      get :index
      assert_response :success
    end
  end

  describe "when authenticated" do
    before do
      login_as Factory(:user)
    end

    it "should redirect to home" do
      get :index
      response.should redirect_to(home_path)
    end
  end
end
  
