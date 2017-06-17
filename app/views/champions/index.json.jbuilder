json.array! @champions do |champion|
  json.id champion.id
  json.name champion.name
  json.portrait champion.portrait
  json.strengths champion.strengths
  json.weaknesses champion.weaknesses
end
