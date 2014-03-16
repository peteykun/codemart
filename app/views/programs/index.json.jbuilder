if !@app_key_matched
  json.error "Invalid App Key"
  json.success false
elsif @programs.nil?
  json.error "Invalid username/password"
  json.success false
else
  json.success true

  json.programs(@programs) do |program|
    json.extract! program, :id, :name, :solved
    json.test_input program.input
  end
end
