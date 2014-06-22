require "boarding_pass"

set :helpers_dir, "helpers"
set :helpers_filename_glob, "**/*_helper.rb"
set :helpers_filename_to_module_name_proc, Proc.new { |filename|
  basename = File.basename(filename, File.extname(filename))
  basename.camelcase
}

Time.zone = "America/Chicago"

activate :react

set :markdown_engine, :redcarpet
set :markdown,
    :fenced_code_blocks => true,
    :no_intra_emphasis => true,
    :strikethrough => true,
    :smartypants => true,
    :tables => true,
    :link_attributes => { target: "_blank" }

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

activate :directory_indexes
page "/sitemap.xml", :layout => false

activate :deploy do |deploy|
  deploy.method = :git
end

set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'
set :fonts_dir,  'fonts'

# Build-specific configuration
configure :build do
  # Minify CSS
  activate :minify_css,
            :ignore => [%r{fonts}],
            :inline => true

  # Minify Javascript on build
  activate :minify_javascript, :inline => true

  # Enable cache buster
  activate :asset_hash, :ignore => [%r{^fonts/cloud}]

  activate :minify_html
  activate :gzip
end
