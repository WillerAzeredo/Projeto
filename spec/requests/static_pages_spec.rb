#encoding: utf-8

require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  let(:base_title) { "Aprendendo Ruby on Rails" }

  describe "Home page" do

    before { visit root_path }
    
    let(:heading) { 'Página Inicial' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    
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
    
    it "should have the right links on the layout" do
      visit root_path
      click_link "Sobre Nós"
      page.should have_selector 'title', text: full_title('Sobre Nós')
      click_link "Ajuda"
      page.should # fill in
      click_link "Contato"
      page.should # fill in
      click_link "Página Inicial"
      click_link "Sign up now!"
      page.should # fill in
      click_link "Apredendo RubyOnRails"
      page.should # fill in
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
