#!/usr/bin/ruby
# 
#
#Backblaze (https://www.backblaze.com/) backup software records the Hostname as Backup name in their portal. This causes issue due to special characters in hostname like Karthikeyan's Mac. Backblaze creates a identifier named hguid which 24 digit alphanumeric and this gets added in the console and its unique. 
# This extension attribute will fetch the hguid from the Mac.
# Created by Karthikeyan Marappan
# 01-May-2022

require 'nokogiri'
if(File.exist?('/Library/Backblaze.bzpkg/bzinstall.xml'))
	doc = Nokogiri::XML(File.open ("/Library/Backblaze.bzpkg/bzinstall.xml"))
	node = doc.xpath("/bzinstall/bzuniqueid/@hguid")[0]
	puts "<result>" + node.content + "</result>"
else
	puts "<result>""Backblaze not installed""</result>"
end
