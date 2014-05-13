FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  # Usable with: FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
  factory :micropost do
    content "Lorem ipsum"
    user
  end
end
