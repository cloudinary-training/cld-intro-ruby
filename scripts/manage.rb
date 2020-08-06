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
# puts jj Cloudinary::Api.resources()

### List up to 500
# puts jj Cloudinary::Api.resources(max_results: 500)

### 
# puts jj Cloudinary::Api.resources(type:'upload', prefix:'sample')

### Rename an asset default overwrite is false
# reupload pizza if needed 
# Cloudinary::Uploader.upload("pizza.jpg", :public_id => "pizza")
# puts jj Cloudinary::Uploader.rename('pizza', 'my_pizza', {overwrite: true})


### Remove an asset

#### Upload API
# load a file to delete, invalidate is false by default, doesn't remove derived
# puts jj Cloudinary::Uploader.upload("lake.jpg", public_id: "lake")
# puts jj Cloudinary::Uploader.destroy("lake", invalidate: true)


#### Admin API
# load a couple of files to delete,invalidate is false by default, allows mulitple and removes derived like DAM
# puts jj Cloudinary::Uploader.upload("pizza.jpg", public_id: "pizza")
# puts jj Cloudinary::Uploader.upload("lake.jpg", public_id: "lake")
# puts jj Cloudinary::Api.delete_resources(public_ids = ["pizza","lake"], invalidate: true)

### Tag on upload

# puts jj Cloudinary::Uploader.upload("blackberry.jpg", public_id: "blackberry", tags: "fruit,berries")


### Tag after upload
# puts jj Cloudinary::Uploader.upload("lake.jpg", public_id: "lake")
# puts jj Cloudinary::Uploader.add_tag("water", "lake")

### Remove a single tag by name 
# puts jj Cloudinary::Uploader.remove_tag("berries", "blackberry")

### Remove all tags list of public ids to remove tags from 
# puts jj Cloudinary::Uploader.remove_all_tags(["blackberry","lake"])

### Remove assets from CDN: invalidate option (review)
# Upload API
# puts jj Cloudinary::Uploader.upload("lake.jpg", public_id: "lake")
# puts jj Cloudinary::Uploader.destroy("lake", invalidate: true)

# Admin API
# puts jj Cloudinary::Uploader.upload("lake.jpg", public_id: "lake")
# puts jj Cloudinary::Api.delete_resources(public_ids = ["lake"], invalidate: true)



