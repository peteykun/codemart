json.array!(@programs) do |program|
  json.extract! program, :id
  json.url program_url(program, format: :json)
end
