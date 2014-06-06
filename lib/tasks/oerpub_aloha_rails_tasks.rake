namespace :oerpub_aloha_rails do
  namespace :copy
    desc 'Copy the precompiled OERPUB Aloha Editor to vendor/assets'
    task :aloha do
      cp File.expand_path('../../../vendor/assets/javascripts/aloha.js', __FILE__),
        'vendor/assets/javascripts'
      cp File.expand_path('../../../vendor/assets/stylesheets/aloha.css', __FILE__),
        'vendor/assets/stylesheets'
    end

    desc 'Copy the OERPUB Aloha Editor configuration files to app/assets'
    task :config do
      cp File.expand_path('../../../app/assets/javascripts/aloha-config.js', __FILE__),
        'app/assets/javascripts'
      cp File.expand_path('../../../app/assets/javascripts/mathjax-config.js', __FILE__),
        'app/assets/javascripts'

      cp File.expand_path('../../../app/assets/stylesheets/cnx-aloha.css', __FILE__),
        'app/assets/stylesheets'
      cp File.expand_path('../../../app/assets/stylesheets/cnx-editbar.css.scss', __FILE__),
        'app/assets/stylesheets'
    end
  end

  desc 'Copy the OERPUB Aloha Editor and the config files to vendor/assets and app/assets, respectively'
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
end
