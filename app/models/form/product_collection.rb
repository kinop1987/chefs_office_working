class Form::ProductCollection < Form::Base
  FORM_COUNT = 10
  attr_accessor :products

  def initialize(attributes = {})
    super attributes
    self.products = FORM_COUNT.times.map { Product.new } unless products.present?
  end

  def products_attributes=(attributes)
    self.products = attributes.map { |_, v| Product.new(v) }
  end

  def save
    Product.transaction do
      products.map do |product|
        product.save! if product.availability == true
      end
    end
    true
  rescue StandardError => e
    reidrect_to new_prodct_path, alert: e.message and return
  end
end
