namespace :oerpub_aloha_rails do
  namespace :copy
    desc 'Copy the precompiled OERPUB Aloha Editor to vendor/assets'
    task :aloha do
      copy_path('vendor/assets/javascripts')
      copy_path('vendor/assets/stylesheets')
    end

    desc 'Copy the OERPUB Aloha Editor configuration files to app/assets'
    task :config do
      copy_path('app/assets/javascripts')
      copy_path('app/assets/stylesheets')
    end

    desc 'Copy the OERPUB Aloha Editor view files to app/views'
    task :views do
      copy_path('app/views')
    end
  end

  desc 'Copy the OERPUB Aloha Editor and its config files to vendor/assets and app/assets, respectively'
  task :install do
    Rake::Task['aloha_rails:copy:aloha'].invoke
    Rake::Task['aloha_rails:copy:config'].invoke
  end

  desc 'Build the OERPUB Aloha Editor and copy it to vendor/assets'
  task :build, :oerpub_aloha_editor_folder do |t, args|
    folder = args[:oerpub_aloha_editor_folder]
    if folder
      sh "#{File.join(folder, 'node_modules/requirejs/bin/r.js')} -o #{
           File.join(folder, 'build/aloha/build-profile-with-oer.js')}"

      cp File.join(folder, 'target/build-profile-with-oer/rjs-output/lib/aloha.js'),
         'vendor/assets/javascripts'
      cp File.join(folder, 'target/build-profile-with-oer/rjs-output/lib/aloha.css'),
        'vendor/assets/stylesheets'
    else
      puts 'Error: You must specify the OERPUB Aloha Editor folder'
      puts 'Clone it from https://github.com/oerpub/Aloha-Editor'
    end
  end

  protected

  def copy_path(path)
    cp_r File.expand_path("../../../#{path}/oerpub", __FILE__),
           path, :verbose => false
  end
end
