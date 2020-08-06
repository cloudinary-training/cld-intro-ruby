# Basic Commands #

<h2 style="color:red">WIP: This is source code for a course under development.</h2>

## Setting up

1. Before running the sample, copy the value from the ClOUDINARY_URL located in the Cloudinary [Management Console](https://cloudinary.com/console) of your account into `config.rb` file of the project.  See the `config.rb.sample`.
```ruby
# Cloudinary.config do |config|
#   config.cloud_name = "djh67gzdu"
#   config.api_key = "722693815472398"
#   config.api_secret = "aNSb-diC2XR_BbwqPUl2NkiXHbA"
# end
Cloudinary.config_from_url("cloudinary://722693815472398:aNSb-diC2XR_BbwqPUl2NkiXHbA@djh67gzdu")

```
1. For the basic sample, you can also simply run `gem install cloudinary`.
1. Uncomment commands and run `ruby upload.rb` to exercise storage commands.
1. Uncomment commands and run `ruby manage.rb` to exercise management commands.

---

**Note**: Commands are wrapped in `JSON.pretty_generate()` abbreviated as `jj`  to make the results easier to read.  They are output for inspection with `puts`.



