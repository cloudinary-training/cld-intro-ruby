# Cloudinary Intro using Ruby #

<h2 style="color:red">WIP: This is source code for a course under development.</h2>

## Ruby install

Use a version of Ruby >= 2.4.  In this repo we are using version 2.5.7 as indicated in the `./scripts/.ruby-version` file.  If you are using a different version of ruby, you can change the value in that file.

### Mac
Mac comes with Ruby installed.
To install the latest version of Ruby use HomeBrew.  You can [install Homebrew](https://brew.sh/) 

```bash
brew install ruby
```

### Windows

https://rubyinstaller.org/

## Setup to run scripts

The scripts are run from the `scripts` directory.

```bash
cd scripts
```



# Basic Commands #

<h2 style="color:red">WIP: This is source code for a course under development.</h2>

## Setting up

1. Install Cloudinary gem. 

```bash 
`gem install cloudinary`
```

1. Before running the sample, create a `./scripts/config.rb` file and copy the value from the ClOUDINARY_URL located in the Cloudinary [Management Console](https://cloudinary.com/console) into the file as an argument for the `config_from_url` command.  See the `config.rb.sample`.
```ruby
# Cloudinary.config do |config|
#   config.cloud_name = ""
#   config.api_key = ""
#   config.api_secret = ""
# end
Cloudinary.config_from_url("cloudinary://API_KEY:API_SECRET@CLOUD_NAME")


## Exercises
You will see that the images and video to be used in the exercises are in the `assets` directory.  Scripts access assets relative to the scripts directory so avigate to the `scripts` directory.  

```bash
cd scripts
```


Commands are commented out in each script.  You can uncomment and run script or copy and paste to run in ruby/irb.

1. Uncomment commands and run `ruby upload.rb` to exercise storage commands.
1. Uncomment commands and run `ruby preset.rb` to exercise preset commands
1. Uncomment commands and run `ruby manage.rb` to exercise management commands.
1. Uncomment commands and run `ruby optimize-transformation.rb` to exercise transformations that optimize.
1. Uncomment commands and run `ruby aesthetics-transform.rb` to exercise transformations that enhance aesthetics.
1. Uncomment commands and run `ruby named-transformation.rb` to exercise creating and using named transformations.

## Using ruby/irb

We are using irb binding. You need version 2.4 or higher of ruby to use this.  We are using cloudinary.yml for irb binding.  The yml is used for rails.  We call out the Development credentials in this binding.

1. Download your `cloudinary.yml` using this link: https://cloudinary.com/console/cloudinary.yml
2. Copy the yml file into `scripts/config`
3. From the `scripts` directory run 

```bash
ruby bin/console.rb
```
4. From the irb you can execute single command
5. Enter `exit` to leave the irb.

---

**Note**: Commands are wrapped in `JSON.pretty_generate()` abbreviated as `jj`  to make the results easier to read.  






The directory `/server` is a bonus that contains code to run a Rails server.


