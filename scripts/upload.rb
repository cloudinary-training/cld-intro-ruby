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


# Upload API

## by resource type

# image (default)
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg"))

# video
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("dog.mp4",:resource_type => "video"))

# raw
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("BLKCHCRY.TTF",:resource_type => "raw"))

# auto
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("BLKCHCRY.TTF",:resource_type => "auto"))

## upload options
### Assign public id
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg", :public_id => "pizza"))

### random
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg"))

### use filename, unique, default
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg",use_filename:true,unique_filename:true))


### use filename, not unique (no additional random characters)
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg",use_filename:true, unique_filename:false))

### folder specify
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg",:folder => "food/my_favorite/"))

### folder part of filename (creates on the fly)
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg", :public_id=> "food/my_favorate/pizza"))


## Remote asset upload

### upload api from remote (https)
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg"))

### load from fetch
# TODO
# puts Cloudinary.url("https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg", :type=>"fetch")
# puts cl_image_tag("pizza")??????

### Auto-upload

### create mapping using Admin API
# puts JSON.pretty_generate(Cloudinary::Api.create_upload_mapping("rb-remote-images", options = {:template => "https://cloudinary-training.github.io/cld-advanced-concepts/assets/images/"}))
## TODO a helper to ask for this


