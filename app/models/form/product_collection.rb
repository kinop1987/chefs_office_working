class Form::ProductCollection < Form::Base
  FORM_COUNT = 10
  attr_accessor :products

  def initialize(attributes = {})
    super attributes
    self.products = FORM_COUNT.times.map { Product.new() } unless self.products.present?
  end
  
  def products_attributes=(attributes)
    self.products = attributes.map { |_, v| Product.new(v) }
  end

  def save
    Product.transaction do
      self.products.map do |product|
        if product.availability == true
          product.save!
        end
      end
    end
      return true
    rescue => e
      return false
  end
end