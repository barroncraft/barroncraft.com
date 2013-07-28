task :default => :server
deploy_branch  = "master"
deploy_dir     = "_heroku" 

desc 'Clean up generated site'
task :clean do
    cleanup
end

desc 'Build site with Jekyll'
task :build => :clean do
    less
    jekyll('build')
end

desc 'Start server with --watch'
task :server => :clean do
    less
    jekyll('server --watch')
end

desc 'Build and deploy'
task :deploy => :build do
    sh 'rsync -rtzh --progress --delete _site/ webfaction:~/webapps/barroncraft_com/'
end

desc 'Create and edit a new post'
task :post, :post_name do |t, args|
    create_post(args[:post_name])
end

desc 'Check links for site already running on localhost:4000'
task :check_links do
    begin
        require 'anemone'
        root = 'http://localhost:4000/'
        Anemone.crawl(root, :discard_page_bodies => true) do |anemone|
            anemone.after_crawl do |pagestore|
                broken_links = Hash.new { |h, k| h[k] = [] }
                pagestore.each_value do |page|
                    if page.code != 200
                        referrers = pagestore.pages_linking_to(page.url)
                        referrers.each do |referrer|
                            broken_links[referrer] << page
                        end
                    end
                end
                broken_links.each do |referrer, pages|
                    puts "#{referrer.url} contains the following broken links:"
                    pages.each do |page|
                        puts "  HTTP #{page.code} #{page.url}"
                    end
                end
            end
        end

    rescue LoadError
        abort 'Install anemone gem: gem install anemone'
    end
end

def cleanup
    sh 'rm -rf _site'
end

def jekyll(opts = '')
    sh 'jekyll ' + opts
end

def less(opts = '')
    Dir::mkdir('css') unless File.directory?('css')
    sh 'lessc -x _less/styles.less > css/styles.css'
end

def create_post(title)
    date = Time.now.strftime('%Y-%m-%d')
    fileName = "_posts/#{date}-#{title.downcase.gsub(' ', '-')}.md"
    File.open(fileName, 'w') do |file|
        file.write(%Q{---
layout: post
title: #{title}
tags: []
last_updated: #{date}
---


})
    end
    system("vim #{fileName}")
end
