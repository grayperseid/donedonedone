require 'spec_helper'

describe "list_items/recently_completed", type: :view do

  it "renders the items completed within the last week" do
    ListItem.create(description: "Hike with Alaska", complete: true, updated_at: Date.yesterday)
    ListItem.create(description: "Build a tiny house", complete: true, updated_at: 2.days.ago)
    assign(:list_items, ListItem.recently_completed)
    render
    expect(rendered).to match(/Hike with Alaska/)
    expect(rendered).to match(/Build a tiny house/)
  end

  it "does not render the incomplete items" do
    ListItem.create(description: "Find whiskey")
    assign(:list_items, ListItem.recently_completed)
    render
    expect(rendered).not_to match(/Find whiskey/)
  end

  it "does not render the items completed over a week ago" do
    ListItem.create(description: "Kill the weeds", complete: true, updated_at: 2.months.ago)
    assign(:list_items, ListItem.recently_completed)
    render
    expect(rendered).not_to match(/Kill the weeds/)
  end

end
