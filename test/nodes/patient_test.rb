require 'test_helper'

# case host patient tests
class PatientTest < Minitest::Test
  def test_should_filter_by_male_gender
    parser = Canql::Parser.new('all male cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '1' }, parser.meta_data['patient.sex'])
  end

  def test_should_filter_by_female_gender
    parser = Canql::Parser.new('all female cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '2' }, parser.meta_data['patient.sex'])
  end

  def test_should_filter_by_missing_fields
    parser = Canql::Parser.new('all cases with missing postcode, date of birth')
    parser_v2 = Canql::Parser.new('all cases with missing postcode and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w(postcode birthdate)
    assert_array_includes parser_v2.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w(postcode birthdate)
  end

  def test_should_filter_by_populated_fields
    parser = Canql::Parser.new('all cases with fields postcode, date of birth')
    parser_v2 = Canql::Parser.new('all cases with tests and fields postcode and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w(postcode birthdate)
    assert_array_includes parser_v2.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w(postcode birthdate)
  end

  def test_should_filter_by_missing_mother_fields
    parser = Canql::Parser.new('all cases with mother with missing postcode, date of birth')
    parser_v2 = Canql::Parser.new('all cases with mother with missing postcode and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['mother.fields_missing'][Canql::EQUALS],
                          %w(postcode birthdate)
    assert_array_includes parser_v2.meta_data['mother.fields_missing'][Canql::EQUALS],
                          %w(postcode birthdate)
  end

  def test_should_filter_by_populated_mother_fields
    parser = Canql::Parser.new('all cases with mother with fields postcode, date of birth')
    parser_v2 = Canql::Parser.new('all cases with mother with fields postcode and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['mother.fields_populated'][Canql::EQUALS],
                          %w(postcode birthdate)
    assert_array_includes parser_v2.meta_data['mother.fields_populated'][Canql::EQUALS],
                          %w(postcode birthdate)
  end
end
