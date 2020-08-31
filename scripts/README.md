# Basic Commands #

<h2 style="color:red">WIP: This is source code for a course under development.</h2>

## Setting up

1. Before running the sample, create a `config.rb` file and copy the value from the ClOUDINARY_URL located in the Cloudinary [Management Console](https://cloudinary.com/console) into the file as an argument for the `config_from_url` command.  See the `config.rb.sample`.
```ruby
# Cloudinary.config do |config|
#   config.cloud_name = ""
#   config.api_key = ""
#   config.api_secret = ""
# end
Cloudinary.config_from_url("cloudinary://API_KEY:API_SECRET@CLOUD_NAME")

```
1. For the basic sample, you can also simply run `gem install cloudinary`.
1. Uncomment commands and run `ruby upload.rb` to exercise storage commands.
1. Uncomment commands and run `ruby manage.rb` to exercise management commands.
1. Uncomment commands and run `ruby preset.rb` to exercise preset commands

---

**Note**: Commands are wrapped in `JSON.pretty_generate()` abbreviated as `jj`  to make the results easier to read.  They are output for inspection with `puts`.



