# frozen_string_literal: true
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

  def test_should_filter_by_stillbirth_outcome
    parser = Canql::Parser.new('all stillborn cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'stillborn' }, parser.meta_data['patient.outcome'])
  end

  def test_should_filter_by_livebirth_outcome
    parser = Canql::Parser.new('all liveborn cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'liveborn' }, parser.meta_data['patient.outcome'])
  end

  def test_should_filter_by_miscarriage_outcome
    parser = Canql::Parser.new('all miscarried cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'miscarried' }, parser.meta_data['patient.outcome'])
  end

  def test_should_filter_by_top_outcome
    parser = Canql::Parser.new('all terminated cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'terminated' }, parser.meta_data['patient.outcome'])
  end

  def test_should_filter_on_specific_edd
    parser = Canql::Parser.new('all cases expected on 20/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2015-06-20', '2015-06-20'] },
                 parser.meta_data['patient.expecteddeliverydate'])
  end

  def test_should_filter_on_edd_range
    parser = Canql::Parser.new('all cases expected between 20/06/2015 and 25/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2015-06-20', '2015-06-25'] },
                 parser.meta_data['patient.expecteddeliverydate'])
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

  def test_should_filter_by_missing_place_of_delivery
    parser = Canql::Parser.new('all cases with missing place of delivery')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w(placeofdelivery)
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

  def test_should_filter_by_missing_mother_fields_v2
    parser = Canql::Parser.new('all cases with mother missing postcode, date of birth')
    parser_v2 = Canql::Parser.new('all cases with mother missing postcode and date of birth')
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
