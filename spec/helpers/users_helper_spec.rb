require 'spec_helper'

describe UsersHelper do
  describe "#gravatar_for" do
    let(:user) { FactoryGirl.create(:user) }
    subject { gravatar_for(user) }

    it { should include('https://secure.gravatar.com/avatar/') }

    context 'size: default' do
      it { should match /\?s=50\W/ }
    end

    context 'size: 500' do
      subject { gravatar_for(user, size: 500) }
      it { should match /\?s=500\W/ }
    end
  end
end
