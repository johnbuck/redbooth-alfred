require_relative 'session_setup'

@client = redboothInit

userProjName = ARGV[0]

@client.project(:create, organization_id: 612416, name: userProjName)

# example from Redbooth console
# https://redbooth.com/api/3/projects?organization_id=612416&name=domtest2

puts userProjName
