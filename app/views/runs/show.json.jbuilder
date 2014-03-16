if !@app_key_matched
  json.error "Invalid App Key"
  json.success false
elsif !@belongs_to_user
  json.error "This program does not belong to you"
  json.success false
elsif !@user_authenticated
  json.error "Invalid username/password"
  json.success false
else
  json.success true

  json.extract! @run, :id, :success, :created_at, :updated_at
  json.url run_url(@run)
end
