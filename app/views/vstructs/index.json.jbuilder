json.array!(@vstructs) do |vstruct|
  json.extract! vstruct, :id, :label, :streaming_fname, :digitization_notes, :status
  json.url vstruct_url(vstruct, format: :json)
end
