json.array!(@titletimes) do |titletime|
  json.extract! titletime, :movie, :hour, :minute, :second, :cheese
  json.url titletime_url(titletime, format: :json)
end
