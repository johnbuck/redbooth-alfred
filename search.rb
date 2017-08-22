require_relative 'session_setup'

@client = redboothInit

userArg = ARGV.join(" ")
resultsHash = {"items": []}

# results = @client.search(query: userArg)
resultsRaw = @client.search(query: 'test with john 1')
results = resultsRaw.response.data

# .find method does not exist on var searchexit

# search.find {|i| i['title'] == 'test with john 1'}

results.each do |i|
  results_obj = {
    		"type": i['target_type'],
    		"title": i['title'],
    		"subtitle": "show '#{i['title']}'",
        "parent_id": i['parent_id'],
    		"arg": i['target_id']
      }
  resultsHash[:items].push(results_obj)
end

searchResults = {"items": []}
binding.pry

resultsHash.each do |i|
  if i["title"].include?("test with john 1")
    searchResults.push(i)
  end
end

puts JSON.generate(searchResults)
