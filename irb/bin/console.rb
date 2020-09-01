# contents of bin/console.rb
# https://cloudinary.com/console/cloudinary.yml
# puts Cloudinary.config.cloud_name
# Cloudinary::Utils.cloudinary_url('pizza', transformation: { width: 300, height: 500, crop: "crop", effect: "improve" })

require 'cloudinary'
ENV["CLOUDINARY_ENV"] = "development"
binding.irb