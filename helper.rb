#
# Create the directory path for the data files in Alfred. The bundle id is obtained
# from the info.plist. There might be a way to read plist in ruby, but I do not know
# it. So, I just ported what I use in bash scripts.
#
bundle_id = `/usr/libexec/PlistBuddy  -c "Print :bundleid" "info.plist"`.strip
$data_dir = "#{Dir.home()}/Library/Application Support/Alfred 2/Workflow Data/#{bundle_id}"

#
# If the data directory does not exist, create it and copy the examples links file into
# it.
#
if ! File.directory?($data_dir)
	Dir.mkdir($data_dir)
	`cp ./links.json "#{$data_dir}/"`
end

#
# Function:       not_in_links
#
# Description:   This function checks to see if the link already exists in the file. If it doesn't,
#                      it returns true. If it does, it returns false.
#
def not_in_links( links, name )
	result = false
	links["links"].each do |link|
		if link["name"] == name
			result = true
		end
	end
	return ! result
end
