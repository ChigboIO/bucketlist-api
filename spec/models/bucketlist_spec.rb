require "rails_helper"

RSpec.describe Bucketlist, type: :model do
  it "has a valid factory" do
    expect(build(:bucketlist)).to be_valid
  end

  let(:bucketlist) { build(:bucketlist) }

  describe "instance method calls" do
    context "when I call the instance methods" do
      it { expect(bucketlist).to respond_to(:name) }
    end
  end

  describe "ActiveModel Validations" do
    it { expect(bucketlist).to validate_presence_of(:name) }
  end

  describe "ActiveModel Association" do
    # some activemodel association tests here
  end
end
