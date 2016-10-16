require 'rails_helper'

RSpec.describe "notes/show", :type => :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :title => "Title",
      :description => "Description",
      :lat => 1.5,
      :long => 1.5,
      :references => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
