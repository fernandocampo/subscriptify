class SubscriptionAnalytics
  attr_reader :subscriptions

  def initialize(subscriptions)
    @subscriptions = subscriptions.to_a
  end

  def monthly_burn_rate
    @monthly_burn_rate ||= subscriptions.sum { |s| monthly_price(s) }
  end

  def annual_projection
    monthly_burn_rate * 12
  end

  def count
    subscriptions.size
  end

  def average_monthly_cost
    return 0.0 if count.zero?

    monthly_burn_rate / count
  end

  # Returns [{category:, total:, percentage:}, ...] sorted by total desc
  def category_breakdown
    @category_breakdown ||= begin
      totals = Hash.new(0.0)
      subscriptions.each { |s| totals[s.category] += monthly_price(s) }
      totals.sort_by { |_, v| -v }.map do |category, total|
        pct = monthly_burn_rate.zero? ? 0 : (total / monthly_burn_rate * 100).round
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
