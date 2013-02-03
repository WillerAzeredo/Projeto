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
    it "should have the content 'Página Inicial'" do
      visit '/static_pages/home'
      page.should have_content('Página Inicial')
    end
    
    it "should have the title 'Página Inicial'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title} | Página Inicial")
    end
    
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

  describe "Help page" do
    it "should have the content 'Ajuda'" do
      visit '/static_pages/help'
      page.should have_content('Ajuda')
    end

    it "should have the title 'Ajuda'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Ajuda")
    end

    it "should not have a custom page title" do
      visit '/static_pages/help'
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

  describe "About page" do
    it "should have the content 'Sobre Nós'" do
      visit '/static_pages/about'
      page.should have_content('Sobre Nós')
    end

    it "should have the title 'Sobre Nós'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | Sobre Nós")
    end

    it "should not have a custom page title" do
      visit '/static_pages/about'
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

  describe "Contact page" do
    it "should have the content 'Contato'" do
      visit '/static_pages/contact'
      page.should have_content('Contato')
    end

    it "should have the title 'Contato'" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => "#{base_title} | Contato")
    end

    it "should not have a custom page title" do
      visit '/static_pages/contact'
      page.should_not have_selector('title', :text => 'Principal')
    end
  end

end
