# frozen_string_literal: true

# PhoneNumber
class PhoneNumber
  REGEX_US_PHONE_NUMBER = /^([2-9]\d\d){2}\d{4}$/.freeze # check the format of a phone number
  REGEX_CLEAN = /[\ +().-]/.freeze # remove all non needed char

  def self.clean(phone_number)
    clean_number = phone_number.gsub(REGEX_CLEAN, '').sub(/^1/, '')
    clean_number if clean_number.match(REGEX_US_PHONE_NUMBER)
  end
end
