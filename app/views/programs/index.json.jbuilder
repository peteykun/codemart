json.array!(@programs) do |program|
  json.extract! program, :id, :name, :solved
  json.test_input program.input
end
