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


## Manage: Admin API and Upload API

### List all assets (up to 500, default 10)
# puts JSON.pretty_generate(Cloudinary::Api.resources())

### List up to 500
# puts JSON.pretty_generate(Cloudinary::Api.resources(:max_results=>500))

### 
# puts JSON.pretty_generate(Cloudinary::Api.resources(:type=>'upload', :prefix=>'sample'))

### Rename an asset default overwrite is false
# reupload pizza if needed 
# Cloudinary::Uploader.upload("pizza.jpg", :public_id => "pizza")
# puts JSON.pretty_generate(Cloudinary::Uploader.rename('pizza', 'my_pizza', {:overwrite=>true}))


### Remove an asset

#### Upload API
# load a file to delete, invalidate is false by default, doesn't remove derived
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("lake.jpg", :public_id => "lake"))
# puts JSON.pretty_generate(Cloudinary::Uploader.destroy("lake", :invalidate=> true))


#### Admin API
# load a couple of files to delete,invalidate is false by default, allows mulitple and removes derived like DAM
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("pizza.jpg", :public_id => "pizza"))
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("lake.jpg", :public_id => "lake"))
# puts JSON.pretty_generate(Cloudinary::Api.delete_resources(public_ids = ["pizza","lake"], :invalidate=> true))

### Tag on upload

# puts JSON.pretty_generate(Cloudinary::Uploader.upload("blackberry.jpg", :public_id=>"blackberry", :tags=>"fruit,berries"))


### Tag after upload
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("lake.jpg", :public_id => "lake"))
# puts JSON.pretty_generate(Cloudinary::Uploader.add_tag("water", "lake"))

### Remove a single tag by name 
# puts JSON.pretty_generate(Cloudinary::Uploader.remove_tag("berries", "blackberry"))

### Remove all tags list of public ids to remove tags from 
# puts JSON.pretty_generate(Cloudinary::Uploader.remove_all_tags(["blackberry","lake"]))

### Remove assets from CDN: invalidate option (review)
# Upload API
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("lake.jpg", :public_id => "lake"))
# puts JSON.pretty_generate(Cloudinary::Uploader.destroy("lake", :invalidate=> true))

# Admin API
# puts JSON.pretty_generate(Cloudinary::Uploader.upload("lake.jpg", :public_id => "lake"))
# puts JSON.pretty_generate(Cloudinary::Api.delete_resources(public_ids = ["lake"], :invalidate=> true))




## Presets
# call from widget in web page or front end app
# puts JSON.pretty_generate(Cloudinary::Api.create_upload_preset(:name => "unsigned-image",
  # :unsigned => true, 
  # :tags => "remote", 
  # :allowed_formats => "jpg,png"))

# call from backend only
# puts JSON.pretty_generate(Cloudinary::Api.create_upload_preset(:name => "signed-image",
#   :unsigned => false, 
#   :tags => "remote", 
#   :allowed_formats => "jpg,png"))

## AFTER LEARNING ABOUT TRANSFORMATIONS

## Named Transformations
# puts JSON.pretty_generate(Cloudinary::Api.create_transformation('standard1','w_150,h_150,c_thumb,g_auto'))

