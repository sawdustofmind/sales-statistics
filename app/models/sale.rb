class Sale < ApplicationRecord
  validates_uniqueness_of :good, scope: :day
end

