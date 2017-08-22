require_relative 'session_setup'

@client = redboothInit

userArg = ARGV.join(" ").downcase

resultsHash = {"items": []}

results = @client.search.response.data

results.each do |i|
  if i["title"].downcase == userArg
    results_obj = {
          "type": i['target_type'],
          "title": i['title'],
          "subtitle": "open '#{i['title']}' in Redbooth",
          "parent_type": i['parent_type'],
          "arg": i['parent_id']
        }
    resultsHash[:items].push(results_obj)
  end
end

puts JSON.generate(resultsHash)
