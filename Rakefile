require './app'

namespace :seed do
  desc "Run migrations"
  task :sample do
    Post.create(title: 'Hello', content: 'World')
  end
end

namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do
    Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), 'app', 'db', 'migrations'))
  end
end