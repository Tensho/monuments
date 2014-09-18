require 'rails_helper'

RSpec.describe "monuments/index", :type => :view do
  before(:each) do
    assign(:monuments, [
      Monument.create!(
        :name => "Name",
        :description => "MyText",
        :category => nil
      ),
      Monument.create!(
        :name => "Name",
        :description => "MyText",
        :category => nil
      )
    ])
  end

  it "renders a list of monuments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
