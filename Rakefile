desc "Arrancamos servidor"
task :default do
  sh "rackup"
end

desc "Test unit"
task :test do
   sh "ruby -Ilib test/test_rock_paper.rb"
end

desc "Ejecutando test con RSPEC"
task :spec do
   sh "rspec --color --format documentation spec/rsack/server_spec.rb"
end

desc "Ejecutando tests con formato: html"
task :rspec_html do
    sh "rspec --format html spec/rsack/server_spec.rb > spec.html"
end
