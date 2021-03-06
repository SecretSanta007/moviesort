require 'trollop'
require 'moviesort/sorter'
#require 'moviesort/notifiers/twitter'

module Moviesort
  class CommandLine
    def self.parse(options)
      new(options.split)
    end
    
    def initialize(argv = ARGV)
      @options = Trollop.options(argv) do
        banner <<-EOS.gsub(/^ {8}/, '')
        Moviesort is a script to sort and file away your TV shows and movies

        Usage: moviesort [options]
        EOS

        opt :source, "Source directory", :default => '.'
        opt :target, "Target directory", :default => '.'
      end
    end
    
    def run
      sorter = Sorter::TV.new(@options[:target])
      sorter.sort_directory(@options[:source])
    end
  end
end
