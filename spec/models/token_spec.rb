require "rails_helper"

RSpec.describe Token, type: :model do
  it "has a valid factory" do
    expect(build(:token)).to be_valid
  end

  let(:token) { build(:token) }

  describe "instance method calls" do
    context "when I call the instance methods" do
      it { expect(token).to respond_to(:value) }
      it { expect(token).to respond_to(:active) }
    end
  end

  describe "ActiveModel Validations" do
    it { expect(token).to validate_presence_of(:value) }
  end

  describe "ActiveModel Association" do
    # some activemodel association tests here
  end
end
