require 'rails_helper'

RSpec.describe "pictures/index", :type => :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        :data => "",
        :name => "Name",
        :description => "MyText",
        :monument => nil
      ),
      Picture.create!(
        :data => "",
        :name => "Name",
        :description => "MyText",
        :monument => nil
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
