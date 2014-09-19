require 'rails_helper'

RSpec.describe "pictures/show", :type => :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :data => "",
      :name => "Name",
      :description => "MyText",
      :monument => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
