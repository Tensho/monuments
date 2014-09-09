require 'rails_helper'

describe "users/new.html.erb" do
  let(:user) { build(:user) }

  it "displays user form" do
    assign :user, User.new
    render
    expect(rendered).to match /Login/
    expect(rendered).to match /Password/
    expect(rendered).to match /Password confirmation/
  end
end
