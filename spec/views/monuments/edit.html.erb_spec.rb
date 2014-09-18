require 'rails_helper'

RSpec.describe "monuments/edit", :type => :view do
  before(:each) do
    @monument = assign(:monument, Monument.create!(
      :name => "MyString",
      :description => "MyText",
      :category => nil
    ))
  end

  it "renders the edit monument form" do
    render

    assert_select "form[action=?][method=?]", monument_path(@monument), "post" do

      assert_select "input#monument_name[name=?]", "monument[name]"

      assert_select "textarea#monument_description[name=?]", "monument[description]"

      assert_select "input#monument_category_id[name=?]", "monument[category_id]"
    end
  end
end
