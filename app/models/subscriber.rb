class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Subscriber < ApplicationRecord
validates :name, presence: true
validates :email, presence: true, email: true, uniqueness: true
validate :name_KJU

def name_KJU
  if name == "Kim Jong Un"
    errors.add(:name, "you can not join")
    end
  end
end
