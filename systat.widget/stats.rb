#!/usr/bin/ruby

require 'erb'
require 'open-uri'

def readUrl(url)
    open(url) do |p| p.read.strip end
rescue StandardError => msg
    "<span class='error'>#{msg}</span>"
end

servers = {
    "thoth" => `~/bin/systat.py`.strip,
    "horus" => readUrl("http://horus/systat"),
    "shadowrealm" => readUrl("https://shadowrealm.org/systat")
}

puts "<html><head></head><body>"
servers.each { |server, data| 
    puts "<div class='hostname'>#{server}</div>"
    puts "<pre class='stats'>#{data}</pre>"
}

puts "</body></html>"

