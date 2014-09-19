require 'rails_helper'

RSpec.describe "pictures/edit", :type => :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :data => "",
      :name => "MyString",
      :description => "MyText",
      :monument => nil
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input#picture_data[name=?]", "picture[data]"

      assert_select "input#picture_name[name=?]", "picture[name]"

      assert_select "textarea#picture_description[name=?]", "picture[description]"

      assert_select "input#picture_monument_id[name=?]", "picture[monument_id]"
    end
  end
end
