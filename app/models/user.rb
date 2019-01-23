class User < ApplicationRecord
  has_many :coffee_tables, dependent: :destroy
  has_many :total_bills
  after_create :create_tables

  MONTHS = [11,10,9,8,7,6,5,4,3,2,1,0]

  def create_tables
    CoffeeTable.create(user_id: User.last.id, ordering: 1)
  end

  class << self
    def data_revenue_months(user)
      all_revenue = []
      all_data = user.total_bills.where(created_at: start_date.beginning_of_day..Date.current.end_of_day).group_by(&:created_at)
      list_data = all_month.each_with_object([]) do |month, results|
        results << all_data.select { |record| month.include?(record.to_date) }.values.flatten
      end
      list_total = list_data.map { |data| data.sum(&:total) }
      list_total.each_with_index() do |total, index|
        all_revenue << { month: list_month[index], total: total }
      end
      all_revenue
    end

    def list_month
      months = all_month.each_with_object([]) { |month, results| results << month.first }
      months.map { |date| date.strftime("%m/%Y") }
    end

    def data_revenue_days(user)
      all_revenue = []
      all_data = user.total_bills.where(created_at: list_days).group_by(&:created_at)
      all_days = (list_days.first.to_date..list_days.last.to_date).to_a
      list_data = all_days.each_with_object([]) do |day, results|
        results << all_data.select { |record| day == record.to_date }.values.flatten
      end
      days_in_month = all_days.map { |date| date.strftime("%d/%m/%Y") }
      list_total = list_data.map { |data| data.sum(&:total) }
      list_total.each_with_index() do |total, index|
        all_revenue << { day: days_in_month[index], total: total }
      end
      all_revenue
    end

    def list_days
      date = Date.current
      from = date - 29.days
      from.beginning_of_day..date.end_of_day
    end

    def start_date
      Date.current.beginning_of_month - 11.months
    end

    def all_month
      date = Date.current
      MONTHS.each_with_object([]) do |number, results|
        month = date - number.months
        results << (month.beginning_of_month..month.end_of_month) if month.beginning_of_month >= start_date
      end
    end
  end
end
