require 'optparse'
require 'mini_magick'


module Mcicons

  class Command

    SIZE_LIST = ['16', '32', '128', '256', '512', '1024']

    def self.run(argv)
      new(argv).execute
    end

    def initialize(argv)
      @argv = argv
    end

    def execute
      option = {}

      OptionParser.new do |opt|
        opt.on('-i Image PATH', 'Image Path') { |v| option[:i] = v }
        opt.on('-o Outputs PATH', 'Outputs Icons Path') { |v| option[:o] = v }

        opt.parse!(ARGV)
      end


      image_path  = option[:i]
      dir_path    = File.dirname(image_path)
      output_path = option[:o].nil? ? dir_path : option[:o]
      tmp_path    = "#{output_path}/app.iconset"

      Dir.mkdir(tmp_path, 999) unless FileTest.exist?(tmp_path)

      @counter = 0

      puts 'conversion start'

      SIZE_LIST.each do |r|
        image = MiniMagick::Image.open(image_path)
        image.format 'png'
        image.resize "#{r}x#{r}!"
        image.write "#{tmp_path}/icon_#{r}x#{r}.png"
        retina_image = MiniMagick::Image.open(image_path)
        retina       = r.to_i * 2
        retina_image.format 'png'
        retina_image.resize " #{retina}x#{retina}!"
        retina_image.write "#{tmp_path}/icon_#{r}x#{r}@2x.png"

        @counter += 100 / SIZE_LIST.count
        puts "#{@counter}% complete."

      end

      puts '100% conversion complete'

      system("iconutil -c icns #{tmp_path}")
      system("rm -rf #{tmp_path}")

      puts 'created icons file'

    end

  end
end
