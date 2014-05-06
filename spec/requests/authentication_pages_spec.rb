require 'spec_helper'

describe "Authentication" do

  subject { page }

  let(:sign_in) { "Sign in" }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "signin" do
    before { visit signin_path }

    context "with invalid information" do
      before { click_button sign_in }

      it { should have_title('Sign in') }
      it "should have an error message of Invalid" do
        should have_error_message("Invalid")
      end

      context "after visiting another page" do
        before { click_link "Home" }
        it('should not have an error message') do
          should_not have_error_message
        end
      end
    end

    context "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
