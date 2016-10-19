json.array!(@questions) do |question|
  json.extract! question, :id, :type, :question_text, :position, :answer_options, :validation_rules
  json.url question_url(question, format: :json)
end
