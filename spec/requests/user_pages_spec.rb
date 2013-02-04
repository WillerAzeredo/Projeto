require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "SignUpPages" do
    before { visit signup_path }
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
  describe "SignInPage" do
    before { visit signup_path }
    
    let(:submit) { "Criar Minha Conta" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe "after submission" do
        before { click_button submit }
        it { should have_selector('title', text: 'Entrar') }
        it { should have_content('error') }
      end

    end
    describe "with valid information" do
      before do
        fill_in "Name", with: "Example"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirma", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('willerazeredo@gmail.com') }
        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Bem Vindo') }
      end
    end
  end
  describe "ProfilePage" do
    let(:user) { FactoryGirl.create(:User) }

    # Code to make a user variable
    before { visit user_path(user) }
    
    it "should have a title name of user" do
      page.should have_selector('h1', text: user.name)
      page.should have_selector('title', text: user.name)
    end
  end
end
