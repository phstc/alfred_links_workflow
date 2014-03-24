require 'json'

def notIn( links, name )
	result = false
	links["links"].each do |link|
		if link["name"] == name
			result = true
		end
	end
	return ! result
end

bundleID = `/usr/libexec/PlistBuddy  -c "Print :bundleid" "info.plist"`.strip
dataDir = "#{Dir.home()}/Library/Application Support/Alfred 2/Workflow Data/#{bundleID}"

if ! File.directory?(dataDir)
	Dir.mkdir(dataDir)
	`cp ./links.json "#{dataDir}/"`
end

query = ARGV.join(' ').strip

links = JSON.parse(File.read("#{dataDir}/links.json"))

# http://www.alfredforum.com/topic/5-generating-feedback-in-workflows/
output = %{<?xml version="1.0"?><items>}

parts = query.split("|")
nparts = parts.count
r = /#{parts[0]}.*/i
icount = 0

if nparts > 1
	if nparts == 2
		output += %{
			<item uid="new" arg="" valid="no" autocomplete="#{parts[0]}|#{parts[1]}|n">
			<title>New Link Address: #{parts[1]}</title>
			<subtitle>Add new Link</subtitle>
			<icon>link.png</icon>
			</item>
		}
		icount += 1
	else
		if notIn(links,parts[0])
			nlink = {}
			nlink['name'] = parts[0]
			nlink['href'] = parts[1]
			links["links"].push(nlink)
			File.write("#{dataDir}/links.json",links.to_json)
		end
		output += %{
			<item uid="new" arg="#{parts[1]}" valid="yes" autocomplete="">
			<title>New Link Name: #{parts[0]}</title>
			<subtitle>New Link Address: #{parts[1]}</subtitle>
			<icon>link.png</icon>
			</item>
		}
		icount += 1
	end
else
	links["links"].each do  |link|
		name = link['name']
		href = link['href']

		if ! name.match(r).nil?
			output += %{
				<item uid="#{name}" arg="#{href}" autocomplete="#{name}">
				<title>#{name}</title>
				<subtitle>#{href}</subtitle>
				<icon>link.png</icon>
				</item>
			}
			icount += 1
		end
	end
end

if icount < 1
	output += %{
		<item uid="new" arg="" valid="no" autocomplete="#{parts[0]}|http://">
		<title>Link Name:  #{parts[0]}</title>
		<subtitle>Create a new Link</subtitle>
		<icon>link.png</icon>
		</item>
	}
end

output += '</items>'

puts output
