json.array!(@playlists) do |playlist|
  json.extract! playlist, :name, :description, :photo_file_name, :photo_content_type, :photo_file_size
  json.url playlist_url(playlist, format: :json)
end