class Board < ActiveRecord::Base
  has_many :pinnings
  has_many :pins, through: :pinnings
  belongs_to :user
  validates_presence_of :name
end
