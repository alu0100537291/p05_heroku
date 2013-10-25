desc "Arrancamos servidor"
task :default do
  sh "rackup"
end

desc "Ejecutando test con RSPEC"
task :rspec do
   sh "rspec --color --format documentation spec/rsack/server_spec.rb"
end

desc "Ejecutando tests con formato: html"
task :rspec_html do
        sh "rspec --format html spec/rsack/server_spec.rb"
end