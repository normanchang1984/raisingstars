require "rails_helper"
RSpec.describe User, :type => :model do

  before(:each) do
    # user
    create(:user)
  end

  let(:user) { User.first }
  let(:profile) { Profile.create( :name => "Hexter", :user_id => user) }

  context ".create" do
    it "the basic proposal with category_id and user_id" do
      expect(profile).to eq(Profile.find_by(:user_id => user.id))
    end
  end
end
