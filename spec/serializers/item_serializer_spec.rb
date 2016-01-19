require "rails_helper"

RSpec.describe ItemSerializer, type: :serializer do
  context "Item Resource Representation" do
    let(:user) { create(:user) }
    let(:bucketlist) { create(:bucketlist, user: user) }
    let(:resource) { create(:item, bucketlist: bucketlist) }
    let(:serializer) { ItemSerializer.new(resource) }

    before(:each) { DatabaseCleaner.start }

    after(:each) { DatabaseCleaner.clean }

    it "responds to instance methods" do
      expect(serializer).to respond_to(:id)
      expect(serializer).to respond_to(:name)
      expect(serializer).to respond_to(:date_created)
      expect(serializer).to respond_to(:date_modified)
      expect(serializer).to respond_to(:done)
    end

    it "has an id that matches the model id" do
      expect(serializer.id).to eql(resource.id)
    end

    it "has a name that matches the model name" do
      expect(serializer.name).to eql(resource.name)
    end

    it "has a done that matches the model done" do
      expect(serializer.done).to eql(resource.done)
    end

    describe "#date_created" do
      it do
        expect(serializer.date_created).to eq(
          DateTime.parse(resource.created_at.to_s).
            strftime("%Y-%m-%d %l:%M %P").in_time_zone
        )
      end
    end

    describe "#date_modified" do
      it do
        expect(serializer.date_modified).to eq(
          DateTime.parse(resource.updated_at.to_s).
            strftime("%Y-%m-%d %l:%M %P").in_time_zone
        )
      end
    end
  end
end
