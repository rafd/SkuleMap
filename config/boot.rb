# Don't change this file!
# Configure your app in config/environment.rb and config/environments/*.rb

RAILS_ROOT = "#{File.dirname(__FILE__)}/.." unless defined?(RAILS_ROOT)

module Rails
  class << self
    def boot!
      unless booted?
        preinitialize
        pick_boot.run
      end
    end

    def booted?
      defined? Rails::Initializer
    end

    def pick_boot
      (vendor_rails? ? VendorBoot : GemBoot).new
    end

    def vendor_rails?
      File.exist?("#{RAILS_ROOT}/vendor/rails")
    end

<<<<<<< HEAD:config/boot.rb
    def preinitialize
      load(preinitializer_path) if File.exist?(preinitializer_path)
=======
    # FIXME : Ruby 1.9
    def preinitialize
      load(preinitializer_path) if File.exists?(preinitializer_path)
>>>>>>> 80b0af3f81f4e9f29a7a450f1ec4c738265c2e4b:config/boot.rb
    end

    def preinitializer_path
      "#{RAILS_ROOT}/config/preinitializer.rb"
    end
  end

  class Boot
    def run
      load_initializer
      Rails::Initializer.run(:set_load_path)
    end
  end

  class VendorBoot < Boot
    def load_initializer
      require "#{RAILS_ROOT}/vendor/rails/railties/lib/initializer"
<<<<<<< HEAD:config/boot.rb
      Rails::Initializer.run(:install_gem_spec_stubs)
      Rails::GemDependency.add_frozen_gem_path
=======
>>>>>>> 80b0af3f81f4e9f29a7a450f1ec4c738265c2e4b:config/boot.rb
    end
  end

  class GemBoot < Boot
    def load_initializer
      self.class.load_rubygems
      load_rails_gem
      require 'initializer'
    end

    def load_rails_gem
      if version = self.class.gem_version
        gem 'rails', version
      else
        gem 'rails'
      end
    rescue Gem::LoadError => load_error
      $stderr.puts %(Missing the Rails #{version} gem. Please `gem install -v=#{version} rails`, update your RAILS_GEM_VERSION setting in config/environment.rb for the Rails version you do have installed, or comment out RAILS_GEM_VERSION to use the latest version installed.)
      exit 1
    end

    class << self
      def rubygems_version
<<<<<<< HEAD:config/boot.rb
        Gem::RubyGemsVersion rescue nil
=======
        Gem::RubyGemsVersion if defined? Gem::RubyGemsVersion
>>>>>>> 80b0af3f81f4e9f29a7a450f1ec4c738265c2e4b:config/boot.rb
      end

      def gem_version
        if defined? RAILS_GEM_VERSION
          RAILS_GEM_VERSION
        elsif ENV.include?('RAILS_GEM_VERSION')
          ENV['RAILS_GEM_VERSION']
        else
          parse_gem_version(read_environment_rb)
        end
      end

      def load_rubygems
        require 'rubygems'
<<<<<<< HEAD:config/boot.rb
        min_version = '1.3.1'
        unless rubygems_version >= min_version
          $stderr.puts %Q(Rails requires RubyGems >= #{min_version} (you have #{rubygems_version}). Please `gem update --system` and try again.)
=======

        unless rubygems_version >= '0.9.4'
          $stderr.puts %(Rails requires RubyGems >= 0.9.4 (you have #{rubygems_version}). Please `gem update --system` and try again.)
>>>>>>> 80b0af3f81f4e9f29a7a450f1ec4c738265c2e4b:config/boot.rb
          exit 1
        end

      rescue LoadError
<<<<<<< HEAD:config/boot.rb
        $stderr.puts %Q(Rails requires RubyGems >= #{min_version}. Please install RubyGems and try again: http://rubygems.rubyforge.org)
=======
        $stderr.puts %(Rails requires RubyGems >= 0.9.4. Please install RubyGems and try again: http://rubygems.rubyforge.org)
>>>>>>> 80b0af3f81f4e9f29a7a450f1ec4c738265c2e4b:config/boot.rb
        exit 1
      end

      def parse_gem_version(text)
        $1 if text =~ /^[^#]*RAILS_GEM_VERSION\s*=\s*["']([!~<>=]*\s*[\d.]+)["']/
      end

      private
        def read_environment_rb
          File.read("#{RAILS_ROOT}/config/environment.rb")
        end
    end
  end
end

# All that for this:
Rails.boot!
