class Pin < ActiveRecord::Base
  belongs_to :category, inverse_of: :pin
  validates_presence_of :title, :url, :slug, :text, :category_id
  validates_uniqueness_of :slug
end