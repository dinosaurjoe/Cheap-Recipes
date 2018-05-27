class Recipe < ApplicationRecord
  require 'nokogiri'
  require 'open-uri'
  has_many :ingredients

  after_create :set_total_time
  after_create :set_photo

  def set_total_time
    @recipe = self

    @recipe.total_time = @recipe.prep_time + @recipe.cooking_time

    @recipe.save!
  end

  def set_photo
    url = URI.parse("https://pixabay.com/en/photos/?q=#{@recipe.name}&hp=&image_type=all&order=popular&cat=&min_width=&min_height=")
    page = Nokogiri::HTML(open(url)).xpath("//img/@src").first

    @recipe.photo = page

    @recipe.save!
  end


end
