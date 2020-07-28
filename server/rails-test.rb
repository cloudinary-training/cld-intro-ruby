require 'rubygems'
require 'bundler/setup'

require 'cloudinary'
require 'cloudinary/helper'


Cloudinary.config_from_url('cloudinary://722693815472398:aNSb-diC2XR_BbwqPUl2NkiXHbA@djh67gzdu')
puts Cloudinary.config.cloud_name

helper.cl_image_tag("pizza")
