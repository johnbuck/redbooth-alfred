require_relative 'session_setup'

@client = redboothInit

# userArg = ARGV[0]
userArg = "projects"

project_collection = @client.project(:index)
project_list = project_collection.response.data


# UPDATE example that WORKS in redbooth
# project = client.project(:update, id: 1780950, name: 'NEW SILLINESS')

# organization_id=612416
# use this id to POST a new project

projectsHash = {"items": []}

project_list.each do |proj|
  list_obj = {
    		"type": "file",
    		"title": proj['name'],
    		"subtitle": "open '#{proj['name']}' in chrome",
    		"arg": proj['id']
      }
  projectsHash[:items].push(list_obj)
end

# "Alfred 3 introduces JSON as the recommended format to return results into Alfred from a Script Filter."
# OUTPUT projectNames to alfred as a list (json format)
puts JSON.generate(projectsHash)
