require 'rails_helper'

RSpec.describe "pictures/new", :type => :view do
  before(:each) do
    assign(:picture, Picture.new(
      :data => "",
      :name => "MyString",
      :description => "MyText",
      :monument => nil
    ))
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do

      assert_select "input#picture_data[name=?]", "picture[data]"

      assert_select "input#picture_name[name=?]", "picture[name]"

      assert_select "textarea#picture_description[name=?]", "picture[description]"

      assert_select "input#picture_monument_id[name=?]", "picture[monument_id]"
    end
  end
end
