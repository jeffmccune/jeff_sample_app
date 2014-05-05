require 'spec_helper'

describe "Static pages" do
  let(:app_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
    it { should have_link(app_name, href: root_path) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { "Sample App" }
    let(:page_title) { 'Home' }

    it_should_behave_like "all static pages"

    it { should have_link('Sign up now!', href: signup_path) }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { "Help" }
    let(:page_title) { "Help" }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { "About Us" }
    let(:page_title) { "About" }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { "Contact Us" }
    let(:page_title) { "Contact" }

    it_should_behave_like "all static pages"
  end
end
