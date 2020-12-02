require 'cloudinary'
require __dir__ + '/../config.rb'
puts Cloudinary.config.cloud_name

require 'irb'
IRB.start
