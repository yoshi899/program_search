class Program < ApplicationRecord
  require "date"
  validates :program_id, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :subtitle, presence: true, length: { maximum: 255 }
  validates :area, presence: true, length: { maximum: 255 }
  validates :service, presence: true, length: { maximum: 255 }
  validates :act, presence: true, length: { maximum: 255 }
end
