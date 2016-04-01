class Pin < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :title, :url, :slug, :text, :category
  validates_uniqueness_of :slug
end