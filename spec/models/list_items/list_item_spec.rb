require 'spec_helper'

describe ListItem, type: :model do

  context "during creation" do
    it "is invalid without a description" do
      item = ListItem.create(description: "")
      expect(item).to be_invalid
    end

    it "is invalid with a description less than 3 characters" do
      item = ListItem.create(description: "oh")
      expect(item).to be_invalid
    end

    it "is invalid with a duplicate description" do
      item = ListItem.create(description: "dupe list item")
      item_2 = ListItem.create(description: "dupe list item")
      expect(item).to be_valid
      expect(item_2).to be_invalid
    end

    it "is valid with a description between 3-120 characters" do
      item = ListItem.create(description: "clean car")
      expect(item).to be_valid
    end

    it "defaults to incomplete" do
      item = ListItem.create(description: "eat apples")
      expect(item.complete).to eq(false)
    end
  end

  describe "#mark_as_complete" do
    it "marks the list items as complete" do
      item = ListItem.create(description: "incomplete item")
      item.mark_as_complete
      expect(item.complete).to eq(true)
    end
  end

end
