# require 'open-uri'
# require 'nokogiri'

# d_url = "https://www.parlonsdiabete.com/parlons-diabete/le-diabete-en-quelques-mots"
# html_file = open(d_url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('.small-12.columns p').each do |element|
#   puts element.text.strip
# end
