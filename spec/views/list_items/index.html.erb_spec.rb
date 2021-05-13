require 'spec_helper'

describe "list_items/index", type: :view do

  it "renders the incomplete list items" do
    ListItem.create(description: "Brush Phoebe")
    ListItem.create(description: "Buy chocolate")
    assign(:list_items, ListItem.incomplete)
    render
    expect(rendered).to match(/Brush Phoebe/)
    expect(rendered).to match(/Buy chocolate/)
  end

  it "does not render the completed list items" do
    ListItem.create(description: "Rake the leaves", complete: true)
    assign(:list_items, ListItem.incomplete)
    render
    expect(rendered).not_to match(/Rake the leaves/)
  end

end
