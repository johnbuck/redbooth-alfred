require_relative 'session_setup'

@client = redboothInit

projId = ARGV.delete_at 0
tlId = ARGV.delete_at 0
userTaskName = ARGV.join(" ")

@client.task(:create, project_id: projId, task_list_id: tlId, name: userTaskName)

puts userTaskName
