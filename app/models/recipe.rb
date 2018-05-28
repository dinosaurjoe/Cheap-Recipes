class Recipe < ApplicationRecord
  require 'nokogiri'
  require 'open-uri'
  has_many :ingredients
  has_many :uploads, dependent: :destroy

  accepts_nested_attributes_for :uploads, allow_destroy: true

  scope :with_upload, -> { joins(:uploads).group('projects.id') }


  after_create :set_total_time
  after_create :set_photo

  def set_total_time
    @recipe = self

    @recipe.total_time = @recipe.prep_time + @recipe.cooking_time

    @recipe.save!
  end

  def set_photo
    if @recipe.photo.nil?
      url = URI.parse("https://pixabay.com/en/photos/?q=#{@recipe.name}&hp=&image_type=all&order=popular&cat=&min_width=&min_height=")
      page = Nokogiri::HTML(open(url)).xpath("//img/@src").first

      @recipe.photo = page

      @recipe.save!
    end
  end


end
