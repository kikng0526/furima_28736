class Address < ApplicationRecord
  belongs_to  :management
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
end
