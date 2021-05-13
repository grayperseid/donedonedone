require 'spec_helper'

describe ListItemsController, type: :controller do

  describe "GET #index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns the incomplete list items to @list_items" do
      list_item = ListItem.create(description: "Skate to the park")
      list_item_2 = ListItem.create(description: "Grocery shop")
      get :index
      expect(assigns(:list_items)).to match_array([list_item, list_item_2])
    end
  end

  describe "PATCH #update" do
    context "with a valid description" do
      before do
        @list_item = ListItem.create(description: "Kayak in Bell Canyon")
        @list_item_params = { id: @list_item.id, list_item: { description: "Swim in Bell Canyon" } }
      end

      it "updates the list_item" do
        patch :update, params: @list_item_params
        @list_item.reload
        expect(response).to be_redirect
        expect(@list_item.description).to eq("Swim in Bell Canyon")
      end

      it "updates the list_item and redirects to the root path" do
        patch :update, params: @list_item_params
        @list_item.reload
        expect(response).to be_redirect
        expect(@list_item.description).to eq("Swim in Bell Canyon")
      end
    end

    context "with an invalid description" do
      before do
        @list_item = ListItem.create(description: "Sunbathe")
        @list_item_params = { id: @list_item.id, list_item: { description: "2x" } }
      end

      it "does not update the line item and re-renders the edit view" do
        patch :update, params: @list_item_params
        @list_item.reload
        expect(@list_item.description).to eq("Sunbathe")
      end

      it "re-renders the edit view" do
        patch :update, params: @list_item_params
        expect(response).not_to be_redirect
      end
    end
  end


  describe "GET #recently_completed" do
    it "has a 200 status code" do
      get :recently_completed
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :recently_completed
      expect(response).to render_template("recently_completed")
    end

    it "assigns the recently completed list items to @list_items" do
      list_item = ListItem.create(description: "Skate to the park", complete: true, updated_at: 3.days.ago)
      list_item_2 = ListItem.create(description: "Grocery shop", complete: true, updated_at: 1.hour.ago)
      list_item_3 = ListItem.create(description: "Eat vitamins", complete: true, updated_at: 1.year.ago)
      get :recently_completed
      expect(assigns(:list_items)).to match_array([list_item, list_item_2])
    end
  end

end
