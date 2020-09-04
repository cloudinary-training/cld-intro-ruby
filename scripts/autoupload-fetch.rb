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

# fetch from a remote server (no Upload API)
# puts Cloudinary::Utils.cloudinary_url("https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg", type: "fetch")

# autoupload (on the fly transforms, all types)
# create a mapped folder in settings named "remote-media" pointing to "https://cloudinary-training.github.io/cld-advanced-concepts/assets/"

# all resource types
# puts Cloudinary::Utils.cloudinary_url("remote-media/video/snowboarding", {resource_type: "video",
#   transformation:{width: 300, crop: "scale"}})

# puts Cloudinary::Utils.cloudinary_url("remote-media/images/dolphin", 
#   {transformation:{width: 300, crop: "scale"}})

# puts Cloudinary::Utils.cloudinary_url("remote-media/raw/data.json", resource_type: "raw")

