module NumberToRank
  extend ActiveSupport::Concern

  SUFFIX = '_in_rank'

  REGISTERED_FIELDS = [
    :moving_speed,
    :life_apptitude,
    :power_apptitude,
    :intelligence_apptitude,
    :accuracy_apptitude,
    :avoidance_apptitude,
    :defence_apptitude
  ]

  included do
    attribute_names.map(&:to_sym).each do |attr_name|
      next unless REGISTERED_FIELDS.include?(attr_name)
 
      define_method "#{attr_name}#{SUFFIX}" do # set method to get the original value
        number_to_rank(self[attr_name])
      end
    end
  end

  private
    def number_to_rank(n)
      return nil if n.nil?
      n_r = [:E, :D, :C, :B, :A]
      n_r[n-1]
    end
end
