desc 'Upload files'
task :server_upload do
  erb = ERB.new(Pathname.new(File.expand_path("../../config/cloudinary.yml", __dir__)).read)
  configuration = YAML.load(erb.result) || {}

  Cloudinary.config do |config|
    config.cloud_name = configuration["development"]["cloud_name"]
    config.api_key = configuration["development"]["api_key"]
    config.api_secret = configuration["development"]["api_secret"]
  end
  puts Cloudinary.config.cloud_name

  # Upload Files for Server app API
  puts jj Cloudinary::Uploader.upload("./uploads/dog.jpg", public_id: "dog", eager: {width: 300})
  puts jj Cloudinary::Uploader.upload("./uploads/faces.jpeg", public_id: "faces", eager: {width: 300})
  puts jj Cloudinary::Uploader.upload("./uploads/face.jpeg", public_id: "face", eager: {width: 300})
  puts jj Cloudinary::Uploader.upload("./uploads/logo.png", public_id: "logo", eager: {width: 300})
  puts jj Cloudinary::Uploader.upload("./uploads/video.mp4", public_id: "video", resource_type: "video", width: 300)

end
