module SubscriptionsHelper
  def subscription_logo_url(name)
    domain = name.parameterize(separator: "") + ".com"
    "https://www.google.com/s2/favicons?sz=128&domain=#{domain}"
  end
end
