require 'rails_helper'

RSpec.describe "todo_items/index", type: :view do
  before(:each) do
    assign(:todo_items, [
      TodoItem.create!(
        :description => "MyText",
        :list => nil
      ),
      TodoItem.create!(
        :description => "MyText",
        :list => nil
      )
    ])
  end

  it "renders a list of todo_items" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
