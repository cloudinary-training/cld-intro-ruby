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
# puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, crop: "scale"})

# cropping takes a chunk out of an image
# puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "crop"})

#use gravity with thumb to get focus on someting interesting or a compass point
# puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "thumb", gravity: "auto"})



# face with gravity: compare auto, face, fill vs thumb
# not all crop types can use gravity
# puts Cloudinary::Utils.cloudinary_url("face", transformation: {width: 300, height: 300, crop: "fill", gravity: "face"})
# puts Cloudinary::Utils.cloudinary_url("face", transformation: {width: 300, height: 300, crop: "fill", gravity: "auto"})
# puts Cloudinary::Utils.cloudinary_url("face", transformation: {width: 300, height: 300, crop: "thumb", gravity: "face"})


# faces with gravity
# puts Cloudinary::Utils.cloudinary_url("faces", transformation: {width: 300, height: 300, crop: "fill", gravity: "faces"})

# logo with thumb
# puts Cloudinary::Utils.cloudinary_url("logo", transformation: {width: 100, height: 100, crop: "thumb"})

# Compression

# puts Cloudinary::Utils.cloudinary_url("faces", transformation: {height: 300, crop: "scale", quality: "auto"})

# auto everything - add auto format
# use media debugger to inspect
# look at size without auto format
puts Cloudinary::Utils.cloudinary_url("lake", transformation: {height: 400, crop: "fill", gravity: "auto", quality: "auto"})
# add auto format
puts Cloudinary::Utils.cloudinary_url("lake", transformation: {height: 400, crop: "fill", gravity: "auto", quality: "auto",fetch_format: "auto"})
