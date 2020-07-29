# Basic Commands #

<p style="color:red">WIP: This is source code for a course under development.</p>

## Setting up

1. Before running the sample, copy the Cloud Name, API Key and API Secret configuration parameters from Cloudinary's [Management Console](https://cloudinary.com/console) of your account into `config.rb` file of the project.  See the `config.rb.sample`.
1. Run `bundle install` in project directory to bring all the required GEMs. For the basic sample, you can also simply run `gem install cloudinary`.
1. Uncomment commands and run `ruby upload.rb` to exercise storage commands.
1. Uncomment commands and run `ruby manage.rb` to exercise management commands.

---

**Note**: Commands are wrapped in `JSON.pretty_generate()` to make the results easier to read.  They are output for inspection with `puts`.



