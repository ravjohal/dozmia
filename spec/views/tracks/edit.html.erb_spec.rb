require 'spec_helper'

describe "tracks/edit" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :track => "MyString",
      :ismn_num => 1,
      :total_plays => 1
    ))
  end

  it "renders the edit track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", track_path(@track), "post" do
      assert_select "input#track_track[name=?]", "track[track]"
      assert_select "input#track_ismn_num[name=?]", "track[ismn_num]"
      assert_select "input#track_total_plays[name=?]", "track[total_plays]"
    end
  end
end
