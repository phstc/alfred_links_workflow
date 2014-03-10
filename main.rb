require 'json'
require 'cgi'

query = ARGV.join(' ').strip.downcase

links = JSON.parse(File.read("links.json", :encoding => "UTF-8"))["links"]

if query != ''
  links.select! do |link|
    name = link['name']

    name.to_s.downcase.include?(query)
  end
end

# http://www.alfredforum.com/topic/5-generating-feedback-in-workflows/
output = %{<?xml version="1.0"?><items>}

links.each do  |link|
  name = CGI.escapeHTML(link['name'])
  href = CGI.escapeHTML(link['href'])

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
