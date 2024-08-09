# frozen_string_literal: true

module Spree
  module UserDecorator
    def self.prepended(base)
      base.has_one :solidus_stripe_customer,
                   class_name: 'SolidusStripe::Customer',
                   as: :source
    end

    def solidus_stripe_customer_id
      solidus_stripe_customer&.stripe_id
    end

    ::Spree::User.prepend(self)
  end
end
