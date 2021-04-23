class ValidatableEnumType < ActiveRecord::Enum::EnumType
  # override assert_valid_value() to supress <ArgumentError>
  # return a value and depend on our own validation
  def assert_valid_value(value)
    value
  end
end
