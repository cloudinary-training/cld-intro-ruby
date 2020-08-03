
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


# Upload API

## by resource type

# image (default)
puts jj Cloudinary::Uploader.upload("pizza.jpg")

# video
puts jj Cloudinary::Uploader.upload("dog.mp4",:resource_type => "video")

# raw
puts jj Cloudinary::Uploader.upload("BLKCHCRY.TTF",:resource_type => "raw")

# auto
puts jj Cloudinary::Uploader.upload("BLKCHCRY.TTF",:resource_type => "auto")

## upload options
### Assign public id
puts jj Cloudinary::Uploader.upload("pizza.jpg", :public_id => "pizza")

### random
puts jj Cloudinary::Uploader.upload("pizza.jpg")

### use filename, unique, default
puts jj Cloudinary::Uploader.upload("pizza.jpg",use_filename:true,unique_filename:true)


### use filename, not unique (no additional random characters)
puts jj Cloudinary::Uploader.upload("pizza.jpg",use_filename:true, unique_filename:false)

### folder specify
puts jj Cloudinary::Uploader.upload("pizza.jpg",:folder => "food/my_favorite/")

### folder part of filename (creates on the fly)
puts jj Cloudinary::Uploader.upload("pizza.jpg", :public_id=> "food/my_favorate/pizza")


## Remote asset upload

### upload api from remote (https)
puts jj Cloudinary::Uploader.upload("https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg")




