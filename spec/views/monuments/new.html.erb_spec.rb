require 'rails_helper'

RSpec.describe "monuments/new", :type => :view do
  before(:each) do
    assign(:monument, Monument.new(
      :name => "MyString",
      :description => "MyText",
      :category => nil
    ))
  end

  it "renders new monument form" do
    render

    assert_select "form[action=?][method=?]", monuments_path, "post" do

      assert_select "input#monument_name[name=?]", "monument[name]"

      assert_select "textarea#monument_description[name=?]", "monument[description]"

      assert_select "input#monument_category_id[name=?]", "monument[category_id]"
    end
  end
end
