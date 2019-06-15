# frozen_string_literal: true

# PhoneNumber
class PhoneNumber
  def self.clean(phone_number)
    clean_number = phone_number.gsub(/\D/, '').sub(/^1/, '')
    clean_number if clean_number.match(/^([2-9]\d\d){2}\d{4}$/)
  end
end
