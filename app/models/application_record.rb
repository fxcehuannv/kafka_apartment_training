class ApplicationRecord < ActiveRecord::Base
  # self.abstract_class = true
  self.abstract_class = true
 
  # connects_to shards: {
  #   default: { writing: :primary, reading: :primary }
  #   # johndoe: { writing: :primary_johndoe, reading: :primary_johndoe },
  #   # timdoe: { writing: :primary_timdoe, reading: :primary_timdoe },
  # }
end
