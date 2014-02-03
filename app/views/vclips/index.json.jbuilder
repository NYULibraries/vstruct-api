json.array!(@vclips) do |vclip|
  json.extract! vclip, :id, :vstruct_id, :time_in, :time_out, :label, :type, :clip_order, :lock_version
  json.url vclip_url(vclip, format: :json)
end
