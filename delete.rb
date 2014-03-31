require 'json'
require './helper'

address = ARGV.join(' ').strip

#
# Get the links from the links.json file in the Data directory.
#
links = JSON.parse(File.read("#{$data_dir}/links.json"))

#
# Create a new json data structure to contain the links we
# want to keep.
#
nlinks = {}
nlinks["links"] = Array.new

#
# Loop over all the links.
#
links["links"].each do |link|
	#
	# If the current link's address does not match the address
	# we want to remove, then save it into our new links structure.
	#
	if link["href"] != address
		nlink = {}
		nlink["name"] = link["name"]
		nlink["href"] = link["href"]
		nlinks["links"].push(nlink)
	end
end

#
# Write the new links structure to the data file.
#
File.write("#{$data_dir}/links.json",nlinks.to_json)

#
# Tell the user that it has been removed.
#
puts "The link #{address} has been removed."
