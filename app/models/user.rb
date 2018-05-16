require 'csv'

class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  }

  def self.as_csv
  attributes = %w{QR Code Name,QR Code Description,Redirection URL}
    CSV.generate do |csv|
      csv << attributes
      all.each do |item|
        csv << [
        item.email,
        item.name,
        "http://localhost:3000/#{item.email}"
      ]
      end
    end
  end

end
