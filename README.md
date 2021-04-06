# Cloudinary Intro using Ruby #

## Ruby install

Use a version of **Ruby >= 2.4**.  In this repo, we are using version 2.5.7 as indicated in the `./scripts/.ruby-version` file.  If you are using a different version of Ruby, you can change the value in that file.

### Mac
Mac comes with Ruby installed.
To install the latest version of Ruby, use HomeBrew.  You can [install Homebrew](https://brew.sh/) 

```bash
brew install ruby
```

### Windows

https://rubyinstaller.org/

## Setup to run scripts

The scripts are run from the `scripts` directory.

1. Clone this repo.

2. Install Cloudinary gem. 

```bash 
`gem install cloudinary`
```
3. Set up credentials.

Create a `./scripts/config.rb` file and copy the value from the ClOUDINARY_URL located in the Cloudinary [Management Console](https://cloudinary.com/console) into the file as an argument for the `config_from_url` command.  See the `config.rb.sample`.  The code below shows two alternatives for adding credentials.

There are two ways you can make the credentials available.

```ruby
# Cloudinary.config do |config|
#   config.cloud_name = "CLOUD_NAME"
#   config.api_key = "API_KEY"
#   config.api_secret = "API_SECRET"
# end
Cloudinary.config_from_url("cloudinary://API_KEY:API_SECRET@CLOUD_NAME")
```

## Exercises
You will see that the images and video to be used in the exercises are in the `assets` directory.  Scripts access assets relative to the scripts directory, so navigate to the `scripts` directory.  

```bash
cd scripts
```

### Running the Exercise Code

Commands are commented out in each script.  You can uncomment and run script or copy and paste to run in Ruby/IRB.

1. Uncomment commands and run `ruby upload.rb` to exercise storage commands.
1. Uncomment commands and run `ruby preset.rb` to exercise preset commands.
1. Uncomment commands and run `ruby autoupload-fetch.rb` to exercise auto-upload and fetch commands.
1. Uncomment commands and run `ruby manage.rb` to exercise management commands.
1. Uncomment commands and run `ruby upload-for-transformations.rb` to load assets used in transformation scripts.
1. Uncomment commands and run `ruby optimize-transformation.rb` to exercise transformations that optimize.
1. Uncomment commands and run `ruby aesthetics-transform.rb` to exercise transformations that enhance aesthetics.
1. Uncomment commands and run `ruby named-transformation.rb` to exercise creating and using named transformations.

## Using Ruby/IRB (optional)

You need version 2.4 or higher of Ruby to use Ruby/IRB.  This will allow you to experiment with your own commands interactively. Once you have set up the `config.rb`, the `scripts/bin/console.rb` will be able to access your credentials.  From the `scripts` directory, run the following:

```bash
ruby bin/console.rb
```

---

**Note**: Commands are wrapped in `JSON.pretty_generate()` abbreviated as `jj`  to make the results easier to read.  

## Rails Server (bonus/optional)
The directory `/server` is a bonus that contains code to run a Rails server.
