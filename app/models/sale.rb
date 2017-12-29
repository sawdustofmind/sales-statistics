class Sale < ApplicationRecord
  validates_uniqueness_of :good, scope: :day

  # static methods
  class << self
    def calculate_statistics(from, to)
      # initial state of statistic hash
      statistic_hash = {
          :from => from,
          :to => to
      }

      goods = []
      total_revenue = BigDecimal(0)
      Sale.where('day >= ?', from).where('day <= ?', to)
          .group(:good).sum(:score).each do
      |good, revenue|
        goods << {'title:' => good, 'revenue' => revenue}
        total_revenue += revenue
      end

      statistic_hash[:goods] = goods
      statistic_hash[:total_revenue] = total_revenue
      statistic_hash
    end
  end
end

