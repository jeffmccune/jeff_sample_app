require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }

    context "with invalid information" do
      it "does not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      context "after submission" do
        before { click_button submit }

        it { should have_title("Sign up") }
        it { should have_content('5 errors') }
        it { should have_content("Name can't be blank") }
        it { should have_content("Email can't be blank") }
        it { should have_content("Email is invalid") }
        it { should have_content("Password can't be blank") }
        it { should have_content("Password is too short") }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "creates a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

end
