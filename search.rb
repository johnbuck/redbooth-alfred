require_relative 'session_setup'

@client = redboothInit

userArg = ARGV.join(" ").downcase
# line below for console testing
# userArg = "ipad pro".downcase

results = @client.search.response.data

resultsHash = {"items": []}

results.each do |i|
  if i["title"].downcase.include?(userArg)
    results_obj = {
          "type": i['target_type'],
          "title": i['title'],
          "subtitle": "open '#{i['title']}' in Redbooth",
          "arg": i['parent_id'] #project id
        }
    resultsHash[:items].push(results_obj)
  end
end
# puts "results hash: ", resultsHash
puts JSON.generate(resultsHash)
