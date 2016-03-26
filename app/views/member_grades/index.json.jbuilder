json.array!(@member_grades) do |member_grade|
  json.extract! member_grade, :id, :name
  json.url member_grade_url(member_grade, format: :json)
end
