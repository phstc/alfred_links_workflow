require 'json'

query = ARGV.join(' ').strip.downcase

links = JSON.parse(File.read('./links.json'))['links']

if query != ''
  links.reject! do |link|
    name = link['name']

    name.to_s.downcase.index(query).nil?
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
