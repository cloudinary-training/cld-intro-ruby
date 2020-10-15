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

# Cropping and Gravity

# default cropping mode is scale with 1 dimension
# puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, crop: "scale"})
# if you add a second dimension it may skew depending on original AR
# puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height:300, crop: "scale"})

# 2 dimensions - no skew but not exact dimensions
# use fit to guarantee that it doesn't skew and fits within the dimensions
# not guaranenteed to result in exact dimensions specified
# puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height:300, crop: "fit"})

# 2 dimensions with no skew and guaranteed exact dimensions rendered with possible padding
# puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height:300, crop: "pad", background: "auto"})

# cropping takes a chunk out of an image
# puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "crop"})

#use gravity with thumb to get focus on someting interesting or a compass point
# puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "thumb", gravity: "auto"})
# puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height: 300, crop: "thumb", gravity: "auto"})

# crop with gravity: auto,  fill vs thumb
# not all crop types can use gravity, only: crop, fill, lfill, fill_pad (auto g only) or thumb
# puts Cloudinary::Utils.cloudinary_url("face", transformation: {width: 300, height: 300, crop: "fill", gravity: "auto"})
# puts Cloudinary::Utils.cloudinary_url("face", transformation: {width: 300, height: 300, crop: "thumb", gravity: "auto"})


# You can open the image file ./assets/gravity-debug.png to see how Cloudinary recognizes faces.

# gravity face
# puts Cloudinary::Utils.cloudinary_url("working", transformation: {width: 300, height: 400, crop: "crop", gravity: "face"})
# puts Cloudinary::Utils.cloudinary_url("working", transformation: {width: 300, height: 400, crop: "thumb", gravity: "face"})

# logo with thumb - watermark, branding
# puts Cloudinary::Utils.cloudinary_url("logo", transformation: {width: 100, height: 100, crop: "thumb"})
# Cloudinary's new logo using scaling
# puts Cloudinary::Utils.cloudinary_url("cloudinary-logo", transformation: {width: 100, crop:"scale"})


# Compression - use media debugger to see the change in size
# puts Cloudinary::Utils.cloudinary_url("cookies")
# puts Cloudinary::Utils.cloudinary_url("cookies", transformation: { quality: "auto"})

# auto everything - add auto format
# use media debugger to inspect
# puts Cloudinary::Utils.cloudinary_url("lake", transformation: {height: 400, crop: "fill", gravity: "auto", quality: "auto"})
# add auto format
# puts Cloudinary::Utils.cloudinary_url("lake", transformation: {height: 400, crop: "fill", gravity: "auto", quality: "auto",fetch_format: "auto"})
