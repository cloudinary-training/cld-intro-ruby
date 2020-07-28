# Training

## Setup

### Use config.rb
```ruby
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
```

### Use config_from_url
```ruby
Cloudinary.config_from_url('cloudinary://KEY:SECRET@CLOUD_NAME')

```

### Use Cloudinary.yml

## Upload API

### Files by Type
 
 #### image


 #### auto

 #### raw


### Assign public id

#### random

#### assign public id

#### use filename,  unique (default)

#### use filename, not unique (no random characters)

#### folder specify

#### folder part of name

### remote asset upload

#### upload api from remote (https)


#### load from fetch

#### Auto-upload

##### create mapping Admin API

##### upload


## Manage: Admin API and Upload API

### List all assets

### Rename an asset

### Remove an asset

#### Upload API

#### Admin API

### Tag on upload

### Tag after upload

### Remove a single tag by name

### Remove all tags

### Remove assets from CDN: invalidate option

## Presets

## Named Transformations





## Transformation & Helpers


