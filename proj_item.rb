require 'json'

usrInput = ARGV[0]

projectsHash = {"items": []}

list_obj = {
  "type": "file",
  "title": "create it!",
  "subtitle": "create rebooth project '#{usrInput}' ",
  "arg": usrInput
}

projectsHash[:items].push(list_obj)

puts JSON.generate(projectsHash)
