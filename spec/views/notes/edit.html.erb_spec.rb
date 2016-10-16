require 'rails_helper'

RSpec.describe "notes/edit", :type => :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :title => "MyString",
      :description => "MyString",
      :lat => 1.5,
      :long => 1.5,
      :references => ""
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input#note_title[name=?]", "note[title]"

      assert_select "input#note_description[name=?]", "note[description]"

      assert_select "input#note_lat[name=?]", "note[lat]"

      assert_select "input#note_long[name=?]", "note[long]"

      assert_select "input#note_references[name=?]", "note[references]"
    end
  end
end
