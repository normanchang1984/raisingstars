require 'rails_helper'

RSpec.describe UserProfilesController, type: :controller do
  before(:each) do
    # user
    create(:user)
    create(:user)
  end

  let(:user1) { User.first }
  let(:user2) { User.last }
  let(:profile) { Profile.create( :name => "Hexter", :user_id => user1) }
  describe ".create" do
    it "basic profile" do
      expect(profile).to eq(profile)
    end
    it "if user already have profile" do
    end
  end
end
