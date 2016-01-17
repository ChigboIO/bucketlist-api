require "rails_helper"

RSpec.describe BucketlistSerializer, type: :serializer do
  context "Bucketlist Resource Representation" do
    let(:user) { create(:user) }
    let(:resource) { create(:bucketlist, user: user) }

    let(:serializer) { BucketlistSerializer.new(resource) }

    it "responds to instance methods" do
      expect(serializer).to respond_to(:id)
      expect(serializer).to respond_to(:name)
      expect(serializer).to respond_to(:date_created)
      expect(serializer).to respond_to(:date_modified)
      expect(serializer).to respond_to(:created_by)
    end

    it "has an id that matches the model id" do
      expect(serializer.id).to eql(resource.id)
    end

    it "has a name that matches the model name" do
      expect(serializer.name).to eql(resource.name)
    end

    describe "#created_by" do
      it "contains the user's name and email" do
        expect(serializer.created_by).to include(user.name)
        expect(serializer.created_by).to include(user.email)
      end
    end

    describe "#date_created" do
      it do
        expect(serializer.date_created).to eq(
          DateTime.parse(resource.created_at.to_s).strftime("%Y-%m-%d %l:%M %P")
        )
      end
    end

    describe "#date_modified" do
      it do
        expect(serializer.date_modified).to eq(
          DateTime.parse(resource.updated_at.to_s).strftime("%Y-%m-%d %l:%M %P")
        )
      end
    end
  end
end
