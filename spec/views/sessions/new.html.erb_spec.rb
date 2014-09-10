require 'rails_helper'

describe "sessions/new.html.erb" do
  it "displays sign in form" do
    render
    expect(rendered).to match /Login/
    expect(rendered).to match /Password/
  end
end
