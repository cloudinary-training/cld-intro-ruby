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

jj Cloudinary::Uploader.upload("./assets/blackberry.jpg", public_id: "blackberry")
jj Cloudinary::Uploader.upload("./assets/BLKCHCRY.TTF",resource_type: "raw")
jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg", public_id: "cheesecake")
jj Cloudinary::Uploader.upload("./assets/dog.jpg", public_id: "dog")
jj Cloudinary::Uploader.upload("./assets/face.jpg", public_id: "face")
jj Cloudinary::Uploader.upload("./assets/faces.jpg", public_id: "faces")
jj Cloudinary::Uploader.upload("./assets/lake.jpg", public_id: "lake")
jj Cloudinary::Uploader.upload("./assets/logo.png", public_id: "logo")
jj Cloudinary::Uploader.upload("./assets/video.mp4", public_id: "video", resource_type: "raw")
jj Cloudinary::Uploader.upload("./assets/cloudinary-logo.png", public_id: "cloudinary-logo")

