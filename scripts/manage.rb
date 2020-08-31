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
# jj Cloudinary::Api.resources()

### List up to 500
# jj Cloudinary::Api.resources(max_results: 500)

### Search by prefix
# jj Cloudinary::Api.resources(type:'upload', prefix:'sample')

### Rename an asset default overwrite is false
# reupload pizza if needed 
# Cloudinary::Uploader.upload("./assets/cheesecake.jpg", :public_id => "cheesecake")
# jj Cloudinary::Uploader.rename('cheesecake', 'my_cheesecake', {overwrite: true})


### Remove an asset

#### Upload API
# load a file to delete, invalidate is false by default, doesn't remove derived
# jj Cloudinary::Uploader.upload("./assets/lake.jpg", public_id: "lake")
# jj Cloudinary::Uploader.destroy("lake", invalidate: true)


#### Admin API
# load a couple of files to delete,invalidate is false by default, allows mulitple and removes derived like DAM
# jj Cloudinary::Uploader.upload("./assets/dog.jpg", public_id: "dog")
# jj Cloudinary::Uploader.upload("./assets/lake.jpg", public_id: "lake")
# jj Cloudinary::Api.delete_resources(public_ids = ["dog","lake"], invalidate: true)

### Tag on upload

# jj Cloudinary::Uploader.upload("./assets/blackberry.jpg", public_id: "blackberry", tags: "fruit,berries")
# jj Cloudinary::Api.resources_by_tag("berries",{tags: true})


### Tag after upload and then search by tag
# jj Cloudinary::Uploader.upload("./assets/lake.jpg", public_id: "lake")
# jj Cloudinary::Uploader.add_tag("water", "lake")
# jj Cloudinary::Api.resources_by_tag("water",{tags: true})


### Remove a single tag by name; search by removed tag and unremoved tag
# jj Cloudinary::Uploader.remove_tag("berries", "blackberry")
# jj Cloudinary::Api.resources_by_tag("berries",{tags: true})
# jj Cloudinary::Api.resources_by_tag("fruit",{tags: true})


### Remove all tags list of public ids to remove tags 
# jj Cloudinary::Uploader.remove_all_tags(["blackberry","lake"])
# jj Cloudinary::Api.resources_by_tag("fruit",{tags: true})
# jj Cloudinary::Api.resources_by_tag("water",{tags: true})


### Remove assets from CDN: invalidate option (review) - cannot access unversioned URL
### Sometimes there's a delay due to caching
# Upload API
# jj Cloudinary::Uploader.upload("./assets/dog.jpg", public_id: "dog")
# jj Cloudinary::Uploader.destroy("dog", invalidate: true)
# puts Cloudinary::Utils.cloudinary_url("dog")

# Admin API uses quota but can accept multiple public ids
# jj Cloudinary::Uploader.upload("./assets/face.jpg", public_id: "face")
# jj Cloudinary::Uploader.upload("./assets/faces.jpg", public_id: "faces")
# jj Cloudinary::Api.delete_resources(public_ids = ["face", "faces"], invalidate: true)
# puts Cloudinary::Utils.cloudinary_url("face")
# puts Cloudinary::Utils.cloudinary_url("faces")



