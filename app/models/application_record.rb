class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_update, -> { order('updated_at DESC') }
end
