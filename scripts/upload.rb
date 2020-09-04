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
# jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg")


# video
# jj Cloudinary::Uploader.upload("./assets/video.mp4",:resource_type => "video")

# raw
# jj Cloudinary::Uploader.upload("./assets/BLKCHCRY.TTF",:resource_type => "raw")

# auto
# jj Cloudinary::Uploader.upload("./assets/video.mp4",:resource_type => "auto")

## upload options
### Assign public id
# jj Cloudinary::Uploader.upload("./assets/face.jpg", :public_id => "face")

### use filename, unique
# jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg",use_filename:true,unique_filename:true)


### use filename, not unique (no additional random characters)
# jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg",use_filename:true, unique_filename:false)

### folder specify
# jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg",:folder => "food/my_favorite/")

## folder part of filename (creates on the fly)
# jj Cloudinary::Uploader.upload("./assets/dog.jpg", :public_id=> "food/my_favorite/dog")


## Remote asset upload

### upload api from remote (https)
# jj Cloudinary::Uploader.upload("https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg")




