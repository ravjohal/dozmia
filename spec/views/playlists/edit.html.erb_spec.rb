require 'spec_helper'

describe "playlists/edit" do
  before(:each) do
    @playlist = assign(:playlist, stub_model(Playlist,
      :name => "MyString",
      :description => "MyText",
      :photo_file_name => "MyString",
      :photo_content_type => "MyString",
      :photo_file_size => "MyString"
    ))
  end

  it "renders the edit playlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", playlist_path(@playlist), "post" do
      assert_select "input#playlist_name[name=?]", "playlist[name]"
      assert_select "textarea#playlist_description[name=?]", "playlist[description]"
      assert_select "input#playlist_photo_file_name[name=?]", "playlist[photo_file_name]"
      assert_select "input#playlist_photo_content_type[name=?]", "playlist[photo_content_type]"
      assert_select "input#playlist_photo_file_size[name=?]", "playlist[photo_file_size]"
    end
  end
end
