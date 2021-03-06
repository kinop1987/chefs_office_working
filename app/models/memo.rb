class Memo < ApplicationRecord
  belongs_to :order
  validates :text, presence: true, length: { maximum: 300 }

  def start_time
    created_at
  end
end
