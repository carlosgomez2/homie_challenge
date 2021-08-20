# frozen_string_literal: true

# Property
class Property < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :rental_price, presence: true
  validates :status, presence: true
  validates :tenant_name, presence: true
  validates :tenant_email, presence: true
  validates :tenant_phone, presence: true
  validates :tenant_availability, presence: true

  # Scopes
  scope :published, -> { where(status: 'published') }
  scope :obtain_values, ->(values) { select(values) }
end
