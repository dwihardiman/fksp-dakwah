json.array!(@episodes) do |episode|
  json.title        episode.title
  json.description  episode.description
  json.episode_thumbnail    episode.episode_thumbnail
end
