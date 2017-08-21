require_relative 'session_setup'

@client = redboothInit

projId = ARGV.delete_at 0

userTlName = ARGV.join(" ")

# to create the new task_list
#API call with argument Arg1=project_id from previous script, Arg2 is usimput-name
# https://redbooth.com/api/3/task_lists?project_id=(ARG1)&name=(ARG2)
@client.task_list(:create, project_id: projId, name: userTlName)

puts userTlName
