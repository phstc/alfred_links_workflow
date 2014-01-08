LINKS = {
  'Pablo'  =>   'http://pablocantero.com',
  'GitHub' =>   'http://github.com/phstc'
}

query = ARGV.join(' ').strip.downcase

if query == ''
  selected = LINKS
else
  selected = LINKS.reject do |name, link|
    name.to_s.downcase.index(query).nil?
  end
end

output = %{<?xml version="1.0"?><items>}

selected.each do |name, link|
  output += %{
  <item uid="#{name}" arg="#{link}" autocomplete="#{name}">
    <title>#{name}</title>
  <icon>link.png</icon>
  </item>
  }
end

output += '</items>'

puts output
