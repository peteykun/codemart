json.extract! @program, :id, :name
json.statement BlueCloth.new(@program.statement).to_html
