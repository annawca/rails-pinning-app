 
 class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, inverse_of: :pin
  has_many :pinnings
  has_many :users, through: :pinnings
  accepts_nested_attributes_for :pinnings
  validates_presence_of :title, :url, :slug, :text, :category_id
  validates_uniqueness_of :slug    
  has_attached_file :image, styles: {medium: "300x300>", thumb: "80x80>"},default_url: ->(attachment) { ActionController::Base.helpers.asset_path("missing_thumb.png") }
  validates_attachment :image, :content_type => { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] } unless Rails.env.test?
end