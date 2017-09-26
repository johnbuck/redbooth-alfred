require_relative 'session_setup'

@client = redboothInit

userArg = ARGV.join(" ").downcase
# line below for console testing
# userArg = "URL".downcase

results = @client.search.response.data

resultsHash = []

results.each do |i|
  if i["title"].downcase.include?(userArg)
    results_obj = {
          "type": "file",
          "title": i['title'],
          "subtitle": "open '#{i['title']}' in Redbooth",
          "arg": i['parent_id']
        }
    resultsHash.push(results_obj)
  end
end
# puts "results hash: ", resultsHash
puts JSON.generate(resultsHash)
