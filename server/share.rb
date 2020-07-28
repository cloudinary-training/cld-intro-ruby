require 'rubygems'
require 'bundler/setup'

require 'cloudinary'
require 'cloudinary/helper'


Cloudinary.config_from_url('cloudinary://KEY:SECRET@CLOUD_NAME)')
puts Cloudinary.config.cloud_name

helper.cl_image_tag("pizza")

