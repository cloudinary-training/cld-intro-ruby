class DemoController < ApplicationController

  before_action :check_configuration

  def check_configuration
    render 'configuration_missing' if Cloudinary.config.api_key.blank?
  end

  def index
    # First, upload local or remote images to Cloudinary.
    # For the purposes of the demo, we do it on each request
    # to keep things simple.
    upload_images
    
    # We can now display the uploaded images and apply transformations on them.
    render
  end

  private

  def local_image_path(name)
    Rails.root.join('uploads', name).to_s
  end

  def upload_images
    @uploads = {}


    # create https urls for each public id
    @uploads[:dog] = Cloudinary::Utils.cloudinary_url("dog.jpg", :width=>300,:crop => :scale, :secure=>true)
    @uploads[:faces] = Cloudinary::Utils.cloudinary_url("faces.jpeg", :width=>300, :crop => :scale,:secure=>true)
    @uploads[:face] = Cloudinary::Utils.cloudinary_url("face.jpeg", :width=>300, :crop => :scale,:secure=>true)
    @uploads[:logo] = Cloudinary::Utils.cloudinary_url("logo.png", :width => 300,:crop => :scale, :secure=>true)
    @uploads[:video] = Cloudinary::Utils.cloudinary_url("video",  :width => 300,:crop => :scale,:secure=>true, :resource_type=>:video)
 

    
      puts JSON.pretty_generate(@uploads[:dog]) 
      puts JSON.pretty_generate(@uploads[:faces]) 
      puts JSON.pretty_generate(@uploads[:logo]) 
      puts JSON.pretty_generate(@uploads[:video]) 



  end

end
