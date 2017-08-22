require_relative 'session_setup'

@client = redboothInit

projId = ARGV.delete_at 0

userTlName = ARGV.join(" ")

@client.task_list(:create, project_id: projId, name: userTlName)

puts userTlName
