#encoding: utf-8

require 'spec_helper'

describe "StaticPages" do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
  let(:base_title) { "Aprendendo Ruby on Rails" }

  describe "Home page" do
    before { visit root_path }
    it "should have the content 'Página Inicial'" do
      #visit home_path
      page.should have_content('Página Inicial')
    end
    
    it "should have the title 'Página Inicial'" do
      #visit home_path
      page.should have_selector('title', :text => "#{base_title} | Página Inicial")
    end
    
    it "should not have a custom page title" do
      #visit home_path
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

  describe "Help page" do
    before { visit help_path }
    it "should have the content 'Ajuda'" do
      #visit help_path
      page.should have_content('Ajuda')
    end

    it "should have the title 'Ajuda'" do
      #visit help_path
      page.should have_selector('title', :text => "#{base_title} | Ajuda")
    end

    it "should not have a custom page title" do
      #visit help_path
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

  describe "About page" do
    before { visit about_path }
    it "should have the content 'Sobre Nós'" do
      #visit about_path
      page.should have_content('Sobre Nós')
    end

    it "should have the title 'Sobre Nós'" do
      #visit about_path
      page.should have_selector('title', :text => "#{base_title} | Sobre Nós")
    end

    it "should not have a custom page title" do
      # visit about_path
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

  describe "Contact page" do
    before { visit contact_path }
    it "should have the content 'Contato'" do
      #visit contact_path
      page.should have_content('Contato')
    end

    it "should have the title 'Contato'" do
      #visit contact_path
      page.should have_selector('title', :text => "#{base_title} | Contato")
    end

    it "should not have a custom page title" do
      #visit contact_path
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

end
