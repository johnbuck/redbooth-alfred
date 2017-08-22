require_relative 'session_setup'

@client = redboothInit

project_id = ARGV[0]
userArg = "tasklists"

tasklists_collection = @client.task_list(:index, project_id: project_id)
tasklist_list = tasklists_collection.response.data

taskListsHash = {"items": []}

tasklist_list.each do |tasklist|
  list_obj = {
    		"type": "file",
    		"title": tasklist['name'],
    		"subtitle": "Add task to '#{tasklist['name']}'",
    		"arg": tasklist['id']
      }
  taskListsHash[:items].push(list_obj)
end

puts JSON.generate(taskListsHash)
