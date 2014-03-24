require 'json'

bundleID = `/usr/libexec/PlistBuddy  -c "Print :bundleid" "info.plist"`.strip
dataDir = "#{Dir.home()}/Library/Application Support/Alfred 2/Workflow Data/#{bundleID}"
query = ARGV.join(' ').strip.downcase

links = JSON.parse(File.read("#{dataDir}/links.json"))['links']

if query != ''
  links.reject! do |link|
    name = link['name']

    name.to_s.downcase.include?(query)
  end
end

# http://www.alfredforum.com/topic/5-generating-feedback-in-workflows/
output = %{<?xml version="1.0"?><items>}

links.each do  |link|
  name = link['name']
  href = link['href']

  output += %{
  <item uid="#{name}" arg="#{href}" autocomplete="#{name}">
    <title>#{name}</title>
    <subtitle>#{href}</subtitle>
  <icon>link.png</icon>
  </item>
  }
end

output += '</items>'

puts output
