require 'cloudinary'

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

# radius rounded corners and transparent background

# puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "thumb", 
#   gravity: "auto", fetch_format: "png" , quality: "auto",
#   radius: "max"})

# borders
# try adding a png extension to the url
# puts Cloudinary::Utils.cloudinary_url("blackberry", transformation: { 
#   border: "10px_solid_rgb:bde4fb",
#   width: 300, height: 300, crop: "thumb", 
#   gravity: "auto", fetch_format: "auto" , quality: "auto",
#   radius: "max"})

# crop pad to capture full image with padding to prevent skew
# change AR vertical to horizontal  
# puts Cloudinary::Utils.cloudinary_url("face", 
#     transformation: { width: 300, height: 200, crop: "pad", 
#     fetch_format: "auto" , quality: "auto",
#     background: "red"})

# Effects and Filters

# color tint
# puts Cloudinary::Utils.cloudinary_url("face",
#   transformation: { width: 300, height: 300, crop: "thumb",
#     gravity: "face", fetch_format: "auto" , quality: "auto",
#     effect: "tint:40:magenta"})

# duotone: chained transformation grayscale + tint
# puts Cloudinary::Utils.cloudinary_url(
#   "face",
#   transformation: [
#     { width: 300, height: 300, crop: "thumb",gravity: "face", effect: "grayscale" },
#     { effect: "tint:40:magenta", fetch_format: "auto",quality: "auto" }
#   ])

# outline effect for transparent images

# puts Cloudinary::Utils.cloudinary_url("blackberry.png", 
#   transformation: { width: 300, height: 300, crop: "thumb",
#     gravity: "auto",  quality: "auto",
#     effect: "outline:15", color: "orange"})

# improve color, contrast, lightness
# puts Cloudinary::Utils.cloudinary_url("blackberry", 
#   transformation: { width: 300, height: 300, crop: "thumb",
#     gravity: "auto", fetch_format: "auto" , quality: "auto",
#     effect: "improve:outdoor"})

# Art filters

# zorro
# puts Cloudinary::Utils.cloudinary_url("lake", 
#   transformation: { width: 300, height: 300, crop: "thumb",
#   fetch_format: "auto" , quality: "auto",
#   effect: "art:zorro"})

# cartoonify
# puts Cloudinary::Utils.cloudinary_url("face", 
#   transformation: { width: 300, height: 300, crop: "thumb",
#     gravity: "face", fetch_format: "auto" , quality: "auto",
#     effect: "cartoonify"})

# Overlay

# Text over image
# puts Cloudinary::Utils.cloudinary_url("faces", 
# transformation: { transformation: [
#   {width: 300, height: 300, crop: "thumb"},
#   {overlay: {font_family: "Arial", font_size: 30, text: "Tutoring"}, 
#     background: "white", color: "blue", 
#     gravity: "north_west", y:10, x:10}
#   ]
#   }
# )

# Image over image
# puts Cloudinary::Utils.cloudinary_url("faces", 
#   transformation: { transformation: [
#     {width: 300, height: 300, crop: "thumb"},
#     {overlay: "logo", height:50,gravity:"south_east", x:10, y:10}
#     ]
#     }
#   )

# Text over video
# puts Cloudinary::Utils.cloudinary_url("video", 
#   { resource_type:"video", 
#     transformation: [
#       {width: 300, crop: "scale"},
#       {overlay: {font_family: "Arial", font_size:30, text:"Earth"}, 
#       background:"white", color:"blue", gravity:"north_west", y:10, x:10}
#   ]
#   }
# )

# Image over video
# puts Cloudinary::Utils.cloudinary_url("video", 
#   { resource_type:"video", 
#     transformation: [
#     {width: 400, crop: "scale", },
#     {overlay: "logo", height:50,gravity:"north_west",x:10,y:10}
#   ]
#   }
# )



