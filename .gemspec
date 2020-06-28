Gem::Specification.new do |spec|
  spec.name                    = "aakashsasikumar"
  spec.version                 = "1.0"
  spec.authors                 = ["Aakash Sasikumar"]
  spec.email                   = ["aakash3697@gmail.com"]

  spec.metadata["plugin_type"] = "theme"

  spec.files                   = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 3.8"
  spec.add_runtime_dependency "jekyll-default-layout", "~> 0.1.4"
  spec.add_runtime_dependency "jekyll-gist", "~> 1.5"
  spec.add_runtime_dependency "jekyll-github-metadata", "~> 2.12"
  spec.add_runtime_dependency "jekyll-include-cache", "~> 0.1"
  spec.add_runtime_dependency "jemoji", "~> 0.11"

end
