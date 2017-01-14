require 'fog'

namespace :sitemap do
  desc 'Upload the sitemap files to S3'
  task upload: :environment do
    puts "Starting sitemap upload to S3..."

    connection = Fog::Storage.new({
      :provider                 => 'AWS',
      :aws_access_key_id        => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key    => ENV['AWS_SECRET_ACCESS_KEY']
    })

    directory = connection.directories.get(ENV['AWS_S3_BUCKET'])

    Dir.entries(File.join(Rails.root, "tmp", "sitemaps")).each do |file_name|
      next if ['.', '..', '.DS_Store'].include? file_name
      path = "#{Rails.application.class.parent_name.underscore}/sitemaps/#{file_name}"
      file = File.new(File.join(Rails.root, "tmp", "sitemaps", file_name))

      begin
        file = directory.files.create(
          :body => file,
          :key  => path,
          :public => true
        )
        # object = bucket.objects[path]
        # object.write(file: file)
      rescue Exception => e
        raise e
      end
      puts "Saved #{file_name} to S3"
    end
  end

  desc 'Create the sitemap, then upload it to S3 and ping the search engines'
  task worker: :environment do
    Rake::Task["sitemap:create"].invoke
    Rake::Task["sitemap:upload"].invoke
    SitemapGenerator::Sitemap.ping_search_engines(MVP::Engine.routes.url_helpers.sitemap_url)
  end
end
