require 'rails_helper'

RSpec.describe "monuments/show", :type => :view do
  before(:each) do
    @monument = assign(:monument, Monument.create!(
      :name => "Name",
      :description => "MyText",
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
