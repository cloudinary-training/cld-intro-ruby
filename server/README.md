# Cloudinary Ruby and Rails Server #

<h2 style="color:red">WIP: This is source code for a course under development.</h2>

### Setting up

## Basic sample for Rails

This sample application demonstrates the usage of Cloudinary's view helpers (e.g. `cl_image_tag`) to apply various image transformations inside Rails views.

### Setting up

1. Run `bundle install` in project directory to bring all the required GEMs. For the basic sample, you can also simply run `gem install cloudinary`.
1. Download `cloudinary.yml` for your account from Cloudinary's [Management Console](https://cloudinary.com/console) or by using this [direct link](https://cloudinary.com/console/cloudinary.yml).
1. Place the downloaded `cloudinary.yml` file into the `config` directory of the project.
1. Create a `config.rb` file from `config.rb.sample` and add credentials to run the server upload.
1. Execute the server upload to load assets into your Cloud account to be used by the server
```bash
ruby server-upload
```
1. In the project directory, run `bundle install` to install all the required dependencies.
1. Run `rails server` to start the development server.
1. Open the sample page in a browser: http://localhost:3000

## Photo Album sample

Simple application for uploading images and displaying them in a list. Implemented using Rails and [CarrierWave](https://github.com/jnicklas/carrierwave) GEM for uploads.

### Setting up

1. Download `cloudinary.yml` for your account from Cloudinary's [Management Console](https://cloudinary.com/console) or by using this [direct link](https://cloudinary.com/console/cloudinary.yml).
1. Place the downloaded `cloudinary.yml` file into the `config` directory of the project.
1. In the project directory, run `bundle install` to install all the required dependencies.
1. Run `rake db:create` and `rake db:migrate` to create the database for the project.
1. Run `rake cloudinary:fetch_assets` to fetch the latest JavaScript library files and create the JavaScript index files
1. Run `rails server` to start the development server.
1. Open the sample page in a browser: http://localhost:3000

## Additional resources ##

* [Ruby on Rails integration documentation](http://cloudinary.com/documentation/rails_integration)
* [Image transformations documentation](http://cloudinary.com/documentation/image_transformations)
* View helpers defined in [helper.rb](https://github.com/cloudinary/cloudinary_gem/blob/master/lib/cloudinary/helper.rb) are automatically available to Rails projects.
* [CarrierWave integration documentation](http://cloudinary.com/documentation/rails_integration#carrierwave)
* [RailsCasts episode on CarrierWave](http://railscasts.com/episodes/253-carrierwave-file-uploads)
* [Installing rbenv on zsh on macOS](https://programmingzen.com/installing-rbenv-on-zsh-on-macos/)


## Credits
Sample Video by https://file-examples.com/
Faces Image by Photo by August de Richelieu from Pexels
Face Photo by mentatdgt from Pexels

