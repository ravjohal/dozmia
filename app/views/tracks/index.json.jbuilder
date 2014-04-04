json.array!(@tracks) do |track|
  json.extract! track, :track, :ismn_num, :total_plays
  json.url track_url(track, format: :json)
end