require 'spec_helper'

describe "UserPages" do
  describe "GET /user_pages" do
    before { visit signup_path }
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get user_pages_index_path
#      response.status.should be(200)
#    end

    it "should have the content 'Entrar'" do
      #visit signup_path
      page.should have_content('Entrar')
    end
    
    it "should have the title 'Entrar'" do
      #visit signup_path
      page.should have_selector('title', text: full_title('Entrar'))
    end
    
    it "should not have a custom page title" do
      #visit signup_path
      page.should_not have_selector('title', :text => 'Principal')
    end
  end
end
