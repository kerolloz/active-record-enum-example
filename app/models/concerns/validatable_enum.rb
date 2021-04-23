module ValidatableEnum
  extend ActiveSupport::Concern

  class_methods do 
    def validatable_enum(*enums_to_fix)
      enums_to_fix.each do |element|
        decorate_attribute_type(element) do |subtype|
          ValidatableEnumType.new(element, defined_enums.fetch(element.to_s), subtype)
        end
      end
    end
  end

end
