# frozen_string_literal: true

# ETL
class ETL
  def self.transform(old)
    res = {}
    old.each_pair { |k, arr| arr.each { |v| res[v.downcase] = k } }
    res
  end
end
