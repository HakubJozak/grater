require_relative 'runner'


module Grater
  module Dconf
    include ::Grater::Runner

    def reset_dconf_dir(key)
      run("dconf reset -f #{key}")      
    end

    def write_dconf_array(property,value)
      if value.empty?
        run("dconf write #{property} '@as []'")
      else
        serialized = value.map { |key| "'#{key}'" }.join(',')
        run("dconf write #{property} \"[#{serialized}]\"")
      end
    end

    def write_dconf_string(property,value)
      run("dconf write #{property} \"'#{value}'\"")
    end

    def read_dconf(property)
      result = run("dconf read #{property}")
      # quick and dirty ... but it works :]
      if result == '@as []'
        []
      else
        eval result
      end
    end
  end
end
