require "rails_helper"

RSpec.describe Bucketlist, type: :model do
  it "has a valid factory" do
    expect(build(:bucketlist)).to be_valid
  end

  let(:bucketlist) { build(:bucketlist) }

  describe "instance method calls" do
    context "when I call the instance methods" do
      it { expect(bucketlist).to respond_to(:name) }
      it { expect(bucketlist).to respond_to(:user_id) }
    end
  end

  describe "ActiveModel Validations" do
    it { expect(bucketlist).to validate_presence_of(:name) }
  end

  describe "ActiveModel Association" do
    it { expect(bucketlist).to have_many(:items) }
    it { expect(bucketlist).to belong_to(:user) }
  end

  describe "Model scopes" do
    it do
      expect(Bucketlist.search("Bucketlist 1").first).to eq(
        Bucketlist.where("name LIKE ?", "Bucketlist 1").first
      )
    end

    it do
      expect(Bucketlist.paginate(limit: 2, page: 1).first).to eq(
        Bucketlist.limit(2).offset(1).first
      )
    end
  end
end
