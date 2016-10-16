json.array!(@notes) do |note|
  json.extract! note, :id, :title, :description, :lat, :long, :references
  json.url note_url(note, format: :json)
end
