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
# puts Cloudinary::Utils.cloudinary_url("cheesecake", 
#   transformation: [{transformation:["standard"]}])

## Use Named Transformation with f_auto
# jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg", public_id: "cheesecake")

# puts Cloudinary::Utils.cloudinary_url("cheesecake", 
#   transformation: [{transformation:["standard"]},{transformation:[fetch_format: "auto"]}])

# create and use complex transformation 

# create complex tranformation
# jj Cloudinary::Utils.cloudinary_url("shirt_only.png", 
#   transformation: {transformation:[
#     {overlay: "logo",effect: "brightness:-21",x:-10,y:-200, width:304, radius:"max"},
#     {overlay: {font_family: "Coustard", font_size: 100,color:"rgb:999999", font_weight: "bold",
#       text: "Hello Jon"}, opacity:70, y:0, x:-10, width: 365}
#   ]})

# name it "complex" don't include f_auto
  # jj Cloudinary::Api.create_transformation("complex", {transformation:[
  #   {overlay: "logo",effect: "brightness:-21",x:-10,y:-200, width:304, radius:"max"},
  #   {overlay: {font_family: "Coustard", font_size: 100,color:"rgb:999999", font_weight: "bold",
  #     text: "Hello Jon"}, opacity:70, y:0, x:-10, width: 365}
  # ]})

# use it and add f_auto
# puts Cloudinary::Utils.cloudinary_url("demo/shirt_only.png", 
#     transformation: [{transformation:["complex"]},{transformation:[fetch_format: "auto"]}])
   

