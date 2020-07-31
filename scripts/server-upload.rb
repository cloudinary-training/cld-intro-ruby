require 'rubygems'
require 'bundler/setup'

require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'

if Cloudinary.config.api_key.blank?
  require './config'
end

if Cloudinary.config.api_key.blank?
  puts
  puts "Please configure this demo to use your Cloudinary account"
  puts "by copying configuration values from the Management Console"
  puts "at https://cloudinary.com/console into config.rb."
  puts
  exit
end


puts Cloudinary.config.cloud_name

# Upload Files for Server app API

puts JSON.pretty_generate(Cloudinary::Uploader.upload("dog.jpg", :public_id => "dog",:eager => {:width => 300}))
puts JSON.pretty_generate(Cloudinary::Uploader.upload("faces.jpeg", :public_id => "faces",:eager => {:width => 300}))
puts JSON.pretty_generate(Cloudinary::Uploader.upload("face.jpeg", :public_id => "face",:eager => {:width => 300}))
puts JSON.pretty_generate(Cloudinary::Uploader.upload("logo.png", :public_id => "logo",:eager => {:width => 300}))
puts JSON.pretty_generate(Cloudinary::Uploader.upload("video.mp4", 
:public_id => "video", 
:resource_type => "video",
:width=>300
))

