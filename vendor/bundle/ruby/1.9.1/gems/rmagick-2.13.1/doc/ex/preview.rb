# -*- encoding : utf-8 -*-
#! /usr/local/bin/ruby -w

require 'RMagick'

img = Magick::Image.read("images/Flower_Hat.jpg").first
preview = img.preview(Magick::SolarizePreview)
preview.minify.write('preview.jpg')
exit

