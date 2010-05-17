Gem::Specification.new do |s|
  s.name = "chimp_mailer"
  s.version = "0.1.0"
  s.author = "Small Spark"
  s.email = "contact@smallspark.com.au"
  s.homepage = "http://github.com/smallspark/chimp_mailer"
  s.platform = Gem::Platform::RUBY
  s.description = s.summary = "A Ruby library for interacting with the MailChimp API."
  s.files = Dir.glob("{lib,spec}/**/*")
  s.require_path = "lib"
  s.add_dependency('weary', '>= 0.7.2')
  s.add_development_dependency('rspec')
end
