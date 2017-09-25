require_relative 'session_setup'

@client = redboothInit

# userArg = ARGV.join(" ").downcase
# line below for console testing
userArg = "Get Sketch Licenses for James and Brian".downcase

resultsHash = {"items": []}

results = @client.search.response.data
# puts results

results.each do |i|
  # this line == is the search query
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
puts "results: ", resultsHash
# puts JSON.generate(resultsHash)
