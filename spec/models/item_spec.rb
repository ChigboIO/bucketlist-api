require "rails_helper"

RSpec.describe Item, type: :model do
  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  let(:item) { build(:item) }

  describe "instance method calls" do
    context "when I call the instance methods" do
      it { expect(item).to respond_to(:name) }
      it { expect(item).to respond_to(:done) }
    end
  end

  describe "ActiveModel Validations" do
    it { expect(item).to validate_presence_of(:name) }
  end

  describe "ActiveModel Association" do
    it { expect(item).to belong_to(:bucketlist) }
  end

  describe "Model scopes" do
    describe ".in_bucketlist" do
      it "returns the bucketlist created by the current user" do
        item = Item.create(name: "Sample Item", bucketlist_id: 1)
        expect(Item.in_bucketlist(1).last).to eq(item)
      end
    end
  end
end
