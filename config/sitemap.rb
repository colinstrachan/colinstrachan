require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://www.colinstrachan.com'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'weekly', :priority => 0.9
end

SitemapGenerator::Sitemap.ping_search_engines