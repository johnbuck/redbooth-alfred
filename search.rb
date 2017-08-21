require_relative 'session_setup'

@client = redboothInit

userArg = ARGV.join(" ")
resultsHash = {"items": []}

# searches for task with userArg
 tasks = @client.task(:index, name: userArg)

#https://redbooth.com/a/#!/projects/1782546/tasks/32140718

# searches for tasklist with userArg
task_lists = @client.task_list(:index, name: userArg) != 0

# searches for project with userArg
projects =  @client.project(:index, name: userArg)
  if projects != 0

# https://redbooth.com/a/#!/projects/1782546/tasks

#
# tasklist_list.each do |tasklist|
#   list_obj = {
#     		"type": "file",
#     		"title": tasklist['name'],
#     		"subtitle": "Add task to '#{tasklist['name']}'",
#     		"arg": tasklist['id']
#       }
#   resultsHash[:items].push(list_obj)
# end

# puts JSON.generate(taskListsHash)
