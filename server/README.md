# Cloudinary Ruby and Rails Server #

<h2 style="color:red">WIP: This is source code for a course under development.</h2>

### Setting up

## Basic sample for Rails

This sample application demonstrates the usage of Cloudinary's view helpers (e.g. `cl_image_tag`) to apply various image transformations inside Rails views.

### Setting up

1. Add `gem 'cloudinary'` to Gemfile.
1. Run `bundle install` in project directory to bring all the required GEMs. 
1. Download `cloudinary.yml` for your account from Cloudinary's [Management Console](https://cloudinary.com/console) or by using this [direct link](https://cloudinary.com/console/cloudinary.yml).
1. Place the downloaded `cloudinary.yml` file into the `config` directory of the project.
1. Execute server upload
```bash
rake server_upload
```
1. In the project directory, run `bundle install` to install all the required dependencies.
1. Run `rails server` to start the development server.
1. Open the sample page in a browser: http://localhost:3000

