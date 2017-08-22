require_relative 'session_setup'

@client = redboothInit

userArg = ARGV.join(" ")
# userArg = "PM"
resultsHash = {"items": []}

results = @client.search.response.data

results.each do |i|
  if i["title"] == userArg
    results_obj = {
          "type": i['target_type'],
          "title": i['title'],
          "subtitle": "show '#{i['title']}'",
          "parent_id": i['parent_id'],
          "arg": i['target_id']
        }
    resultsHash[:items].push(results_obj)
  end
end

puts JSON.generate(resultsHash)
