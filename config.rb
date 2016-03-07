

######################################################
# General Configuration
######################################################

# Directory locations
	set :css_dir, '/assets/css'
	set :js_dir, '/assets/js'
	set :images_dir, '/assets/img'
	set :fonts_dir, '/assets/fonts'
	set :data_dir, 'source/data'
	set :relative_links, true
 	set :trailing_slash, false

# Markdown Settings
	set :markdown_engine, :redcarpet
	set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, with_toc_data: true, :smartypants => true


######################################################
# Helpers
######################################################

# svg sprites
# activate :middleman_scavenger do |config|
# 	config.path = "source/assets/svg"
# 	config.prefix = "icon-"
# 	config.sprite_path = "source/assets/svg/output"
# end

# Internationalization Helper
activate :i18n, :mount_at_root => :en

#highlights code examples
activate :syntax

######################################################
# /news blog
######################################################

# blog build
activate :blog do |blog|
	blog.name = "news"
	blog.sources = 	"/{lang}/news/articles/{year}-{month}-{day}-{title}.html"
  blog.permalink = "/news/{title}.html"
	blog.taglink = "tags/:tag.html"
	blog.layout = "/partials/post"
	# blog.summary_length = 250
	# blog.tag_template = "tag.html"
	# blog.calendar_template = "calendar.html"
	# blog.paginate = true
	# blog.per_page = 10
	# blog.page_link = "page/:num"
	blog.default_extension = ".md"
end

# remove file extentions from URLS
activate :directory_indexes

######################################################
# Page options, layouts, aliases and proxies
######################################################

# Per-page layout changes:

# No layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/feed.xml", layout: false
page "/sitemap.xml", :layout => false

# With alternative layout
# page "/news/posts", :layout => "layouts/news"

# Dev-specific configuration
configure :development do

	# Reload the browser automatically whenever files change
	activate :livereload

 # un-comment what you files you want to IGNORE from dev build time (Do not commit these changes)
	# -- IGNORE DOCS ---
	# ignore 'en/docs/*'

end # end of local dev

# Build-specific configuration
configure :build do

	#autoprefixer
	activate :autoprefixer do |config|
	  config.browsers = ['last 2 versions', 'Explorer >= 9']
	  config.ignore   = ['/assets/css/atomic/generic/hacks.css']
	end

  # Minify CSS on build
	activate :minify_html do |html|
	  # html.remove_multi_spaces        = true   # Remove multiple spaces
	  # html.remove_comments            = true   # Remove comments
	  # html.remove_intertag_spaces     = false  # Remove inter-tag spaces
	  # html.remove_quotes              = true   # Remove quotes
	  # html.simple_doctype             = false  # Use simple doctype
	  # html.remove_script_attributes   = true   # Remove script attributes
	  # html.remove_style_attributes    = false  # Remove style attributes
	  # html.remove_link_attributes     = true   # Remove link attributes
	  # html.remove_form_attributes     = false  # Remove form attributes
	  # html.remove_input_attributes    = true   # Remove input attributes
	  # html.remove_javascript_protocol = true   # Remove JS protocol
	  # html.remove_http_protocol       = false  # Remove HTTP protocol
	  # html.remove_https_protocol      = false  # Remove HTTPS protocol
	  # html.preserve_line_breaks       = false  # Preserve line breaks
	  # html.simple_boolean_attributes  = true   # Use simple boolean attributes
	  # html.preserve_patterns          = nil    # Patterns to preserve
	end

  # Use relative URLs
		activate :relative_assets

  # Enable cache buster
  	activate :cache_buster
  	activate :minify_css

  # Minify Javascript on build
   	activate :minify_javascript


	# Ignore Files that get
	# ignore 'js/_*'
	# ignore 'js/vendor/*'
	# ignore 'css/_*'
	# ignore 'css/vendor/*'

end # end of build
