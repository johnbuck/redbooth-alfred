require_relative 'session_setup'

@client = redboothInit

userProjName = ARGV[0]

@client.project(:create, organization_id: 612416, name: userProjName)

puts userProjName
