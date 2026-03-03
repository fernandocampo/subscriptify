module Subscriptions
  class AnalyticsService
    attr_reader :subscriptions

    def initialize(user)
      @subscriptions = user.subscriptions.to_a
    end

    def monthly_total
      @monthly_total ||= subscriptions.sum { |s| monthly_price(s) }
    end

    def yearly_total
      monthly_total * 12
    end

    def count
      subscriptions.size
    end

    def next_payment
      @next_payment ||= subscriptions
        .select { |s| s.payment_date >= Date.today }
        .min_by(&:payment_date)
    end

    def category_distribution
      @category_distribution ||= subscriptions.each_with_object(Hash.new(0)) do |s, counts|
        counts[s.category] += 1
      end
    end

    def average_monthly_cost
      return 0.0 if count.zero?

      monthly_total / count
    end

    # Returns [{category:, total:, percentage:}, ...] sorted by total desc
    def category_breakdown
      @category_breakdown ||= begin
        totals = Hash.new(0.0)
        subscriptions.each { |s| totals[s.category] += monthly_price(s) }
        totals.sort_by { |_, v| -v }.map do |category, total|
          pct = monthly_total.zero? ? 0 : (total / monthly_total * 100).round
          { category: category, total: total, percentage: pct }
        end
      end
    end

    def top_category
      category_breakdown.first
    end

    private

    def monthly_price(subscription)
      subscription.frequency == "Monthly" ? subscription.price.to_f : subscription.price.to_f / 12.0
    end
  end
end
