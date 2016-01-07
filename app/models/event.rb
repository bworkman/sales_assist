class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact

  scope :ordered, -> { order(:date) }
end
