class Product < ApplicationRecord

  validates :name, :category, presence: true

  def short_response
    as_json(
      only: %i[id name description category release_date price],
      methods: %i[formated_release_date fomated_price]
    )
  end

  def formated_release_date
    release_date.strftime('%d %b %Y')
  end

  def fomated_price
    "Rs. #{price}"
  end
end
