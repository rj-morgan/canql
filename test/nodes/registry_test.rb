require 'test_helper'

# tumour host registry tests
class RegistryTest < Minitest::Test
  def test_should_filter_by_registry_code
    parser = Canql::Parser.new('all 68 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '68' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_registry_abbreviation
    parser = Canql::Parser.new('all thames cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '68' }, parser.meta_data['patient.registry'])
  end
end
