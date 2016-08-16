require 'json'

def run(cmd, quiet=true)
  puts "Running #{cmd}" if ENV['DEBUG'] == 'true'
  command = [cmd]
  command << "&>/dev/null" if quiet
  system(command.join(' '))
end

namespace :db do
  desc 'Pull down production database'
  task :import => ['db:dump:postgres', 'db:import:postgres'] do
    puts "Done"
  end

  namespace :capture do
    task :postgres do
      puts "Capturing Production Backup ..."
      run("heroku pg:backups capture", false)
    end
  end

  namespace :dump do
    task :postgres do
      Rake::Task["db:capture:postgres"].execute if ENV['CAPTURE']
      puts "Loading Production Dump ..."
      run("curl -o tmp/latest.dump `heroku pg:backups public-url`")
    end

    task :clean do
      run("rm tmp/latest.dump")
    end
  end

  namespace :import do
    task :postgres => ['kill_postgres_connections','db:drop','db:create'] do
      config   = Rails.configuration.database_configuration
      host     = config[Rails.env]["host"]
      database = config[Rails.env]["database"]
      username = config[Rails.env]["username"]
      password = config[Rails.env]["password"]

      puts "Importing to #{database} ..."

      cmd = ["pg_restore --verbose --clean --no-acl --no-owner"]
      cmd << "-h #{host}" if host.present?
      cmd << "-U #{username}" if username.present?
      cmd << "-p #{password}" if password.present?
      cmd << "-d #{database}"
      cmd << "tmp/latest.dump"
      run(cmd.join(' '))
    end

    task :kill_postgres_connections => :environment do
      env = "development"
      db_config = Rails.configuration.database_configuration[env]
      fail(ArgumentError, "Could not find db config entry for env (#{env})") unless db_config
      db_name = db_config['database']

      # thanks to http://stackoverflow.com/questions/12924466/capistrano-with-postgresql-error-database-is-being-accessed-by-other-users
      # previously, we were kill'ing the postgres processes: http://stackoverflow.com/questions/2369744/rails-postgres-drop-error-database-is-being-accessed-by-other-users
      cmd = %(psql -c "SELECT pid, pg_terminate_backend(pid) as terminated FROM pg_stat_activity WHERE pid <> pg_backend_pid();" -d '#{db_name}')

      unless run(cmd)
        fail $?.inspect
      end
    end

  end
end
