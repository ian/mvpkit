module Mvp
  module Iteration
    CONFIG_FILE = File.join(Rails.root, '.iteration')

    class << self
      def write(json)
        _file = File.open( CONFIG_FILE, "w+" )
        _file.write(JSON.pretty_generate(json))
        _file.close

        @config = json
      end

      def read
        @config ||= begin
                      JSON.parse( IO.read(CONFIG_FILE), symbolize_names: false )
                    rescue
                      write({'version' => '0.0.1'})
                    end
      end

      def bump!(bump)
        config = read
        config['version'] = Semantic::Version.new(config['version']).increment!(bump.downcase.to_sym).to_s
        write(config)
      end

      def version
        read["version"]
      end
    end
  end
end
