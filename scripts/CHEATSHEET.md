# Cheatsheet

You can uncomment Ruby command in script and run script or copy/paste commands in to irb. We use `jj` to display object responses and `puts` to output string responses. 

Assets are in the `./scripts/assets` directory unless we are obtaining from remote.

All images and video are from [pexels](https://www.pexels.com)

## Upload

``` bash
ruby upload.rb
```

### default
Upload an image and supply a public id of 20 random characters

```ruby
jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg")
```
### video
Upload video

```ruby
jj Cloudinary::Uploader.upload("./assets/video.mp4",:resource_type => "video")
```

### raw
Upload raw

```ruby
jj Cloudinary::Uploader.upload("./assets/BLKCHCRY.TTF",:resource_type => "raw")
```

### auto

```ruby
jj Cloudinary::Uploader.upload("./assets/video.mp4",:resource_type => "auto")
```  

### Upload Options

#### Assign public id

```ruby
jj Cloudinary::Uploader.upload("./assets/face.jpg", :public_id => "face")
```

#### Use filename, unique 
Six (6) characters are added to filename to create public id.

```ruby
jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg",use_filename:true,unique_filename:true)
```

#### Use filename, not unique

```ruby
use filename, not unique (no additional random characters)
```

#### Specify folder name

```ruby
jj Cloudinary::Uploader.upload("./assets/cheesecake.jpg",:folder => "food/my_favorite/")
```

#### Let Cloudinary create folder on the fly from public id

```ruby
jj Cloudinary::Uploader.upload("./assets/dog.jpg", :public_id=> "food/my_favorite/dog")
```

### Remote asset upload

```ruby
jj Cloudinary::Uploader.upload("https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg")
```




## Preset

You can create these manually in the DAM or using script.

### Unsigned Preset
You can use this for front end widgets and API calls.  You don't need to hide secrets.  You would usually use this in an app hosted on a secured web page.  It can't be used to upload in Media Library. Before you can use unsigned presets you need to click on a link in setting in the DAM.

#### Create Un-Signed Preset
We're adding a tag and limiting formats that can be uploaded.

```ruby
puts jj Cloudinary::Api.create_upload_preset(name: "unsigned-image",
  unsigned: true, 
  tags: "unsigned", 
  allowed_formats: "jpg,png")
```

#### Use Un-Signed Preset in Upload

```ruby
jj Cloudinary::Uploader.unsigned_upload("./assets/logo.png","unsigned-image")
```

#### Use Un-signed Preset with upload widget
Locate `./scripts/index.html`.  Replace `<cloud-name>` with your cloud name.  Open with local http server to see how the unsigned preset can work with a widget.

### Signed Preset
Use the signed preset for backend scripts with access to API_SECRET credentials.  If you want to use a preset in the DAM it must be signed.


#### Create Signed Preset
We're adding a tag and limiting formats that can be uploaded.

```ruby
puts jj Cloudinary::Api.create_upload_preset(name: "signed-image",
  unsigned: false, 
  tags: "signed", 
  allowed_formats: "jpg,png")
```

#### Use Signed Preset

```ruby
jj Cloudinary::Uploader.upload("./assets/logo.png", upload_preset: "signed-image")
```

## Auto-upload and Fetch

Fetch and Auto-upload are techniques for moving assets from remote locations into your cloud.  While the Upload API allows you to load from remote locations, these techniques are good for loading assets into the cloud only when they are requested by the user.

Instead of using API calls to upload and cache assets, we'll create URLs and then when we request the URL in the browser, the asset will get loaded and cached.

### Fetch
Fetch lets you load an asset by specifying the remote URL with a "fetch" delivery type.  When using the Upload API we were using the "upload" delivery type and we didn't specify it because it was the default.  You saw the term `upload` in the URLs in the Upload API response.  In order to use fetch, we'll specify "fetch" when we create a URL.

```ruby 
puts Cloudinary::Utils.cloudinary_url("https://cdn.pixabay.com/photo/2015/03/26/09/39/cupcakes-690040__480.jpg", type: "fetch")
```

### Auto-upload
In order to use Auto-Upload you need to go to the DAM settings upload tab.  Add a mapping between a directory in your cloud and a remote path.  For this exercise, create a mapping between `remote-media` and `https://cloudinary-training.github.io/cld-advanced-concepts/assets/`.  Notice we are specifying a specific asset, but a path.  

Fetch can only be used for images, but Auto upload can be used for all asset types.

We use the URL helper in the Ruby SDK to create a URL.  

#### Auto-upload Video

```ruby
puts Cloudinary::Utils.cloudinary_url("remote-media/video/snowboarding", {resource_type: "video",
   transformation:{width: 300, crop: "scale"}})
```

#### Auto-upload Image

```ruby
puts Cloudinary::Utils.cloudinary_url("remote-media/images/dolphin", 
   {transformation:{width: 300, crop: "scale"}})
```

#### Auto-upload Raw

```ruby
puts Cloudinary::Utils.cloudinary_url("remote-media/raw/data.json", resource_type: "raw")
```

## Manage

### List all assets (default is 10)

```ruby
jj Cloudinary::Api.resources()
```

### List up to 500 assets

```ruby
jj Cloudinary::Api.resources(max_results: 500)
```

###  Search by prefix (public id "starts with")

```ruby
jj Cloudinary::Api.resources(type:'upload', prefix:'sample')
```

### Rename an assets with overwrite (default overwrite is false)

```ruby
jj Cloudinary::Uploader.rename('cheesecake', 'my_cheesecake', {overwrite: true})
```

### Remove an asset

Deleting from a CDN is different that deleting from a database.  It can take time for the asset to be fully removed.  After you've removed an asset, when you got to your browser to check that its not available, remember that your browser can cache so be sure that browser caching is disabled when you test.

#### Upload API: `destroy`
Use `invalide:true` to remove from CDN.  May take some time depending on CDN.  You remove only 1 asset at a time with the Upload API.

```ruby
jj Cloudinary::Uploader.destroy("lake", invalidate: true)
```


#### Admin API: `delete_resource`
You can remove multiple assets at a time with the Admin API.  There is a daily quota.

```ruby
# upload 2 assets and them remove them
jj Cloudinary::Uploader.upload("./assets/dog.jpg", public_id: "dog")
j Cloudinary::Uploader.upload("./assets/lake.jpg", public_id: "lake")
jj Cloudinary::Api.delete_resources(public_ids = ["dog","lake"], invalidate: true)

```

### Tag on Upload
You can supply tags and other metadata like Context on upload.  You can then find assets by tag.

```ruby
jj Cloudinary::Uploader.upload("./assets/blackberry.jpg", public_id: "blackberry", tags: "fruit,berries")
jj Cloudinary::Api.resources_by_tag("berries",{tags: true})
```

### Tag after upload 
You can add tags to assets that are already in the Media Library.  You can also include an option, `tags:true` to show all tags per asset found in the result.

```ruby
jj Cloudinary::Uploader.upload("./assets/lake.jpg", public_id: "lake")
jj Cloudinary::Uploader.add_tag("water", "lake")
jj Cloudinary::Api.resources_by_tag("water",{tags: true})

```

#### Remove all tags in a list of assets
First we remove all tags and then we try to access by tag.  We won't find the assets that have no tags.

```ruby
jj Cloudinary::Uploader.remove_all_tags(["blackberry","lake"])
jj Cloudinary::Api.resources_by_tag("fruit",{tags: true})
jj Cloudinary::Api.resources_by_tag("water",{tags: true})

```

## Upload for Transformations
In order to have a set of assets available for delivery scripts, run the `upload-for-transformation` script.

```bash
ruby upload-for-transformation.rb
```

## Optimization Transformations
Look at cropping, compression and optimal browser formats.  Cropping modes (scale, crop, thumb, fit, fill, and more) have different use cases and different options available.

### Cropping

#### scale: Default copping mode with 1 dimension is scale

```ruby
puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, crop: "scale"})
```

If you add a second dimension with the `scale` crop mode, it may skew the image depending the image's original aspect ratio.

```ruby
uts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height:300, crop: "scale"})
```

#### fit: Applying 2 dimensions to a crop mode without skew
You can use the `fit` mode to guarantee that the image will render without skew within the boundaries defined by the `width` and `height` options.  However, the dimensions of the image may not match the `width` and `height` when you use `fit`.

```ruby
puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height:300, crop: "fit"})
```

#### pad: Apply 2 dimensions with no skew 
Use padding to ensure that the image is the exact dimensions specified in the `height` and `width` options.

```ruby
puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height:300, crop: "pad"})
```

#### crop: Intro to Gravity
Gravity provides focus.  You can apply compass point gravity or let Cloudinary find the focus using `gravity: auto`.  You can only use gravity with the `crop`, `fill`, `fill_pad` (auto only), and `thumb` crop modes.

#### Crop mode without gravity
Without gravity, all you see is a chunk of dog fur.

```ruby 
puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "crop"})
```

#### Crop mode with gravity
In these examples you see the effect of gravity working with the `thumb` mode.

``` ruby
puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "thumb", gravity: "auto"})
puts Cloudinary::Utils.cloudinary_url("cheesecake", transformation: {width: 300, height: 300, crop: "thumb", gravity: "auto"})

```

#### fill vs thumb modes

```ruby
puts Cloudinary::Utils.cloudinary_url("face", transformation: {width: 300, height: 300, crop: "fill", gravity: "auto"})
puts Cloudinary::Utils.cloudinary_url("face", transformation: {width: 300, height: 300, crop: "thumb", gravity: "auto"})

```

#### debug gravity auto
Generate a URL with gravity auto and debug to better understand how the AI that detects objects is working.  The `gravity:auto` option appears in the URL as `g_auto`.

```ruby
puts Cloudinary::Utils.cloudinary_url("faces", transformation: {width: 300, height: 300, crop: "fill", gravity: "auto"})
```

Now add the debug (use your cloud name) by adding `:debug` after the `g_auto`.

```
https://res.cloudinary.com/<cloud name>/image/upload/c_crop,g_auto:debug,h_300,w_300/faces
```

#### gravity:face
Cloudinary can detect faces.  Specify gravity for the face.

```ruby
puts Cloudinary::Utils.cloudinary_url("working", transformation: {width: 300, height: 400, crop: "crop", gravity: "face"})
puts Cloudinary::Utils.cloudinary_url("working", transformation: {width: 300, height: 400, crop: "thumb", gravity: "face"})
```

#### Branding and Watermarking using cropping

```ruby
puts Cloudinary::Utils.cloudinary_url("logo", transformation: {width: 100, height: 100, crop: "thumb"})

puts Cloudinary::Utils.cloudinary_url("cloudinary-logo", transformation: {width: 100, crop:"scale"})

```
### Compression

Compression is provided with the `quality` option.  You can specify a numeric value form 0-100 with 100 being the highest quality and the least compression.  You can also let Cloudinary determine the best quality with the least size by using `quality: auto`.  The is a recommended best practice.

Use the media debugger in the browser to compare file size in the following images.

```ruby
puts Cloudinary::Utils.cloudinary_url("cookies")
puts Cloudinary::Utils.cloudinary_url("cookies", transformation: { quality: "auto"})

```

### Browser file formats
Different browsers can render different file formats.  Formats provide optimization in terms of size. and quality.

Use `fetch_format: auto` which translates to `f_auto` to let Cloudinary return an image container that is optimized for the requesting browser.

Format optimization handled at the CDN layer.

* webp: chrome, firefox, edge
* ogg: safari
* jpg: all browsers

In the example below we generate "auto everything"

```ruby
puts Cloudinary::Utils.cloudinary_url("lake", transformation: {height: 400, crop: "fill", gravity: "auto", quality: "auto"})
```

## Aesthetic Transformations
Use aesthetic options to achieve results and styling similar to what you find with CSS or Photoshop.

### radius
Similar to CSS radius.  The `radius: max` will generate a circle for a 1:1 aspect ratio.

```ruby
puts Cloudinary::Utils.cloudinary_url("dog", transformation: {width: 300, height: 300, crop: "thumb", 
    gravity: "auto", format: "png" , quality: "auto",
    radius: "max"})
```

### borders
Add borders with a syntax similar to CSS.  You can use HTML Color names, rgb, or rgba.

```ruby
puts Cloudinary::Utils.cloudinary_url("blackberry", transformation: { 
   border: "10px_solid_rgb:bde4fb",
   width: 300, height: 300, crop: "thumb", 
   gravity: "auto", format: "auto" , quality: "auto",
   radius: "max"})
```

### Add background when there is padding

```ruby
 puts Cloudinary::Utils.cloudinary_url("face", 
     transformation: { width: 300, height: 200, crop: "pad", 
     format: "auto" , quality: "auto",
     background: "red"})
```
### Effect option

#### Outline transparent images
Use the `effect` option. Set the width of the outline in pixels. 

```ruby
 puts Cloudinary::Utils.cloudinary_url("blackberry.png", 
   transformation: { width: 300, height: 300, crop: "thumb",
    gravity: "auto",  quality: "auto",
    effect: "outline:15", color: "orange"})
```

#### Improve color, contrast and light

```ruby
puts Cloudinary::Utils.cloudinary_url("lake", 
   transformation: { width: 300, height: 300, crop: "thumb",
     gravity: "auto", format: "auto" , quality: "auto",
     effect: "improve"})
```

#### Art filters

##### "zorro" is one of many

```ruby
puts Cloudinary::Utils.cloudinary_url("lake", 
   transformation: { width: 300, height: 300, crop: "thumb",
     gravity: "face", format: "auto" , quality: "auto",
    effect: "art:zorro"})
```

##### "cartoonify"

```ruby

 puts Cloudinary::Utils.cloudinary_url("face", 
  transformation: { width: 300, height: 300, crop: "thumb",
     gravity: "face", format: "auto" , quality: "auto",
     effect: "cartoonify"})
```

##### "tint": try different colors and intensities

```ruby
 puts Cloudinary::Utils.cloudinary_url("face", 
   transformation: { width: 300, height: 300, crop: "thumb",
     gravity: "face", format: "auto" , quality: "auto",
     effect: "tint:40:magenta"})
```

##### "duotone"
This is a chained transformation.  It instructs Cloudinary to run transformations in sequence.  First a grayscale is set and then the grayscale is tinted. It's coded as an array of transformation objects.  In the URL, you'll see the transformations separated by `/`.

```ruby
 puts Cloudinary::Utils.cloudinary_url("face", 
 transformation: [
   {transformation: [width: 300, height: 300, crop: "thumb",gravity: "face", effect: "grayscale"]}, 
  { transformation:[effect: "tint:40:magenta"]},
   { transformation:[format: "auto",quality: "auto"]}
   ]
 )
```

### Overlays
* Text can be laid over images or video
* Images can be laid over images or video
* Video can be laid over images or video

#### Text over image
Required options are font_family, font_size, and text.

```ruby
 puts Cloudinary::Utils.cloudinary_url("faces", 
 transformation: { transformation: [
   {width: 300, height: 300, crop: "thumb"},
   {overlay: {font_family: "Arial", font_size: 30, text: "Tutoring"}, 
     background: "white", color: "blue", 
     gravity: "north_west", y:10, x:10}
   ]
   }
 )
```

#### Image over video

```ruby
 puts Cloudinary::Utils.cloudinary_url("video", 
   { resource_type:"video", 
     transformation: [
     {width: 400, crop: "scale", },
     {overlay: "cloudinary-logo", height:25,gravity:"south_east"}
   ]
   }
 )
```

#### Text over video

```ruby

puts Cloudinary::Utils.cloudinary_url("video", 
   { resource_type:"video", 
     transformation: [
       {width: 300, crop: "scale"},
       {overlay: {font_family: "Arial", font_size:30, text:"Earth"}, 
       background:"white", color:"blue", gravity:"north_west", y:10, x:10}
   ]
   }
 )
```


## Named Transformations
You can create a transformation template by using named transformations.  They cleanup your URLs to make them better for SEO.  If you want to hide your transformations or underlying assets used in overlays, named transformations can help.

### Create a named transformation from a string

```ruby
jj Cloudinary::Api.create_transformation('standard','w_150,h_150,c_thumb,g_auto')
```

### Use named transformation
Notice that the named you use to create the named transformation gets prefixed with a `t_` when you use it in URL.

```ruby
puts Cloudinary::Utils.cloudinary_url("cheesecake", 
  transformation: [{transformation:["standard"]}])
```

### Use a named transformation with f_auto

You can't include `f_auto` in a named transformation because it is handled at the CDN and not by internal Cloudinary servers.  You can chain the `f_auto` to your named transformation as shown below.

If the named transformation already exists you'll get an error letting your know.

```ruby
 puts Cloudinary::Utils.cloudinary_url("cheesecake", 
   transformation: [{transformation:["standard"]},{transformation:[fetch_format: "auto"]}])

```

### A super complex chained transformation

#### The transformation

```ruby
 jj Cloudinary::Utils.cloudinary_url("demo/shirt_only.png", 
   transformation: {transformation:[
     {opacity: 0},
     {overlay: "demo:cloudinary_logo",effect: "brightness:-21",x:-5,y:-200, width:324},
     {overlay: {font_family: "Coustard", font_size: 100,color:"rgb:999999", font_weight: "bold",text: "Hello Jon"},
    opacity:70, y:0, width: 365},
     {overlay: "demo:shirt_displace",effect: "displace",x:10,y:10},
     {underlay: "demo:shirt_only",effect: "red:-50"},
     {underlay: "demo:model2"},
     {overlay: "demo:heather_texture",opacity:29},
     {fetch_format: "auto"}
   ]})
```

#### make it a named transformation
Don't include `f_auto`

```ruby
 jj Cloudinary::Api.create_transformation("complex", {transformation:[
     {opacity: 0},
     {overlay: "demo:cloudinary_logo",effect: "brightness:-21",x:-5,y:-200, width:324},
     {overlay: {font_family: "Coustard", font_size: 100,color:"rgb:999999", font_weight: "bold",text: "Hello Jon"},
     opacity:70, y:0, width: 365},
     {overlay: "demo:shirt_displace",effect: "displace",x:10,y:10},
     {underlay: "demo:shirt_only",effect: "red:-50"},
     {underlay: "demo:model2"},
     {overlay: "demo:heather_texture",opacity:29}
   ]})
  ```

  ### The complex transformation is now easier to use
  We can add `f_auto` to it.

  ```ruby
puts Cloudinary::Utils.cloudinary_url("demo/shirt_only.png", 
     transformation: [{transformation:["complex"]},{transformation:[fetch_format: "auto"]}])
  
  ```
