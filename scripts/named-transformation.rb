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
# https://eitanpeer-res.cloudinary.com/image/upload/o_0/l_demo:cloudinary-logo,w_324,y_-200,x_-5,e_brightness:-21/l_text:Coustard_100_bold:hello%20Jon7,y_0,co_rgb:999999,o_70,w_365/l_demo:shirt_displace,e_displace,x_10,y_10/u_demo:shirt_only,e_red:-50/u_demo:model2/l_demo:heather_texture,o_29/v1552891639/demo/shirt_only.png

# create complex tranformation
# jj Cloudinary::Utils.cloudinary_url("demo/shirt_only.png", 
#   transformation: {transformation:[
#     {opacity: 0},
#     {overlay: "demo:cloudinary_logo",effect: "brightness:-21",x:-5,y:-200, width:324},
#     {overlay: {font_family: "Coustard", font_size: 100,color:"rgb:999999", font_weight: "bold",text: "Hello Jon"},
#     opacity:70, y:0, width: 365},
#     {overlay: "demo:shirt_displace",effect: "displace",x:10,y:10},
#     {underlay: "demo:shirt_only",effect: "red:-50"},
#     {underlay: "demo:model2"},
#     {overlay: "demo:heather_texture",opacity:29},
#     {fetch_format: "auto"}
#   ]})

# name it "complex" don't include f_auto
  # jj Cloudinary::Api.create_transformation("complex", {transformation:[
  #   {opacity: 0},
  #   {overlay: "demo:cloudinary_logo",effect: "brightness:-21",x:-5,y:-200, width:324},
  #   {overlay: {font_family: "Coustard", font_size: 100,color:"rgb:999999", font_weight: "bold",text: "Hello Jon"},
  #   opacity:70, y:0, width: 365},
  #   {overlay: "demo:shirt_displace",effect: "displace",x:10,y:10},
  #   {underlay: "demo:shirt_only",effect: "red:-50"},
  #   {underlay: "demo:model2"},
  #   {overlay: "demo:heather_texture",opacity:29}
  # ]})

# use it and add f_auto
# puts Cloudinary::Utils.cloudinary_url("demo/shirt_only.png", 
#     transformation: [{transformation:["complex"]},{transformation:[fetch_format: "auto"]}])
   

