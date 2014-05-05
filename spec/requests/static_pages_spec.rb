require 'spec_helper'

describe "Static pages" do
  let(:app_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Sample App') }
    it { should have_title("#{app_title}") }
    it { should have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title("#{app_title} | Help") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title("#{app_title} | About") }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact Us') }
    it { should have_title("#{app_title} | Contact") }
  end
end
