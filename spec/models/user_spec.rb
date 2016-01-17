require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe "instance method calls" do
    context "when I call the instance methods" do
      it { expect(user).to respond_to(:name) }
      it { expect(user).to respond_to(:email) }
      it { expect(user).to respond_to(:password) }
    end
  end

  describe "ActiveModel Validations" do
    it { expect(user).to validate_presence_of(:name) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email) }

    it { expect(user).to allow_value("emmanuel.chigbo@andela.com").for(:email) }
    it { expect(user).not_to allow_value("emmanuel.chigbo@andela").for(:email) }
    it { expect(user).not_to allow_value("emmanuel.chigbo").for(:email) }
    it { expect(user).not_to allow_value("@.").for(:email) }
  end

  describe "ActiveModel Association" do
    it { expect(user).to have_many(:bucketlists) }
  end
end
