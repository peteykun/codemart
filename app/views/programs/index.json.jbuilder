json.array!(@programs) do |program|
  json.extract! program, :id, :name
  json.statement BlueCloth.new(program.statement).to_html
  json.url program_url(program, format: :json)
end
