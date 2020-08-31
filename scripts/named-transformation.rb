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


## Manage: Admin API Create a named transformation

## Named Transformations
# jj Cloudinary::Api.create_transformation('standard','w_150,h_150,c_thumb,g_auto')

## Use Named Transformation
# jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg", public_id: "cheesecake")

# jj Cloudinary::Utils.cloudinary_url("cheesecake", 
#   transformation: [{transformation:["standard"]},{transformation:[fetch_format: "auto"]}])

