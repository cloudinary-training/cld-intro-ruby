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


## Manage: Admin API Preset


## Presets
# call from widget in web page or front end app
# puts jj Cloudinary::Api.create_upload_preset(name: "unsigned-image",
#   unsigned: true, 
#   tags: "unsigned", 
#   allowed_formats: "jpg,png")

## use signed preset
# jj Cloudinary::Uploader.unsigned_upload("./assets/logo.png","unsigned-image")

# call from backend or media library only
# puts jj Cloudinary::Api.create_upload_preset(name: "signed-image",
#   unsigned: false, 
#   tags: "signed", 
#   allowed_formats: "jpg,png")

## use signed preset
# jj Cloudinary::Uploader.upload("./assets/logo.png", upload_preset: "signed-image")




