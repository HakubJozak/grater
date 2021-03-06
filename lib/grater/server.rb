require 'listen'



module Grater
  class Server
    include Grater::Sxhkd

    def initialize(options)
      @pipe = options[:pipe]
      @file = options[:file]
      @keys_file = options[:keys]
      @verbose = options[:verbose]
      reload
      watch_for_changes
    end

    def run
      puts "Ready to grate some cheese!"

      open(@pipe, "r+") do |input|
        while line = input.gets.strip
          puts "Received: '#{line}'"

          case line.upcase
          when 'RELOAD'
            reload
          when 'QUIT'
            break
          # when 'RESTART'
          #   exec "bundle exec ruby #{$0} -p #{options[:pipe]}
          else
            process_command(line)
          end
        end
      end
    ensure
      puts "Deleting #{@pipe}"
      File.delete(@pipe)
      @listener.stop
    end

    def process_command(name)
      if cmd = @commands[name]
        cmd.run
      else
        puts "Unknown command '#{name}'"
      end
    end

    private

    def watch_for_changes
      dir = File.dirname(@file)
      base = File.basename(@file)

      @listener = Listen.to(dir,only: /^#{base}$/) do |modified, _,_|
        if File.basename(modified.first) == base
          reload
        end
      end

      @listener.start
    end

    def reload
      puts "Reading #{@file}"
      @commands = Grater::Dsl::Root.read(@file)
      write_hotkeys(@commands)
    end
  end
end
