# frozen_string_literal: true

require 'test_helper'

# Patient host patient tests
class Patientest < Minitest::Test
  def test_should_filter_by_male_gender_patients
    parser = Canql::Parser.new('all male patients')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '1' }, parser.meta_data['patient.sex'])
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_female_gender_patients
    parser = Canql::Parser.new('all female patients')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '2' }, parser.meta_data['patient.sex'])
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_not_filter_by_stillbirth_outcome
    parser = Canql::Parser.new('all stillborn patients')
    refute parser.valid?
  end

  def test_not_should_filter_by_livebirth_outcome
    parser = Canql::Parser.new('all liveborn patients')
    refute parser.valid?
  end

  def test_not_should_filter_by_miscarriage_outcome
    parser = Canql::Parser.new('all miscarried patients')
    refute parser.valid?
  end

  def test_not_should_filter_by_top_outcome
    parser = Canql::Parser.new('all terminated patients')
    refute parser.valid?
  end

  def test_should_filter_by_primary_patient_patients
    parser = Canql::Parser.new('all primary patients')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'primary' }, parser.meta_data['patient.primacy'])
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_alias_patient
    parser = Canql::Parser.new('all alias patients')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'alias' }, parser.meta_data['patient.primacy'])
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_not_filter_on_specific_edd
    parser = Canql::Parser.new('all patient expected on 20/06/2015')
    refute parser.valid?
  end

  def test_should_not_filter_on_edd_range
    parser = Canql::Parser.new('all patient expected between 20/06/2015 and 25/06/2015')
    refute parser.valid?
  end

  def test_should_filter_by_missing_fields
    parser = Canql::Parser.new('all patients with missing sex, date of birth')
    parser_v2 = Canql::Parser.new('all patients with missing sex and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[sex birthdate]
    assert_array_includes parser_v2.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[sex birthdate]
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_not_filter_by_missing_place_of_delivery
    parser = Canql::Parser.new('all patients with missing place of delivery')
    refute parser.valid?
  end

  def test_should_not_filter_by_missing_screening_status
    parser = Canql::Parser.new('all patients with missing screening status')
    refute parser.valid?
  end

  def test_should_filter_by_populated_fields
    parser = Canql::Parser.new('all patients with fields sex, date of birth')
    parser_v2 = Canql::Parser.new('all patients with tests and fields sex and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[sex birthdate]
    assert_array_includes parser_v2.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[sex birthdate]
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_dob_alias_valid
    query1 = 'all patients with missing date of birth'
    parser = Canql::Parser.new(query1)
    message = "That's a reference test for 'dob' alias, if this fails,\
               something is wrong!!!"
    assert(parser.valid?, message)

    query1 = 'all patients with missing dob'
    parser = Canql::Parser.new(query1)
    correct = base_meta_data(:patient).merge(
      'patient.fields_missing' => { 'equals' => ['birthdate'] }
    )
    message = '\'dob\' should be a valid alias for \'date of birth\'!'
    assert(parser.valid?, message)
    assert_equal(correct, parser.meta_data, message)
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_dob_alias_query
    query1 = 'all patients with missing sex, date of birth'
    query2 = 'all patients with missing sex, dob'
    parser1 = Canql::Parser.new(query1)
    parser2 = Canql::Parser.new(query2)
    message = '\'dob\' doesn\'t work as an alias of \'date of birth\'!'
    assert parser1.valid?
    assert parser2.valid?
    assert_equal(parser1.meta_data, parser2.meta_data, message)

    query1 = "first 27 male patients \
      born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing sex and date of birth \
      and qa action and unprocessed paediatric records"
    query2 = "first 27 male patients \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing sex and dob \
      and qa action and unprocessed paediatric records"
    parser1 = Canql::Parser.new(query1)
    parser2 = Canql::Parser.new(query2)
    message1 = 'parser1 is not valid!'
    message2 = 'parser2 is not valid!'
    message3 = "'dob' doesn't work as an alias of 'date of birth'\
      in a complicated query!"
    assert parser1.valid?, message1
    assert parser2.valid?, message2
    assert_equal(parser1.meta_data, parser2.meta_data, message3)
  end

  def test_should_not_filter_on_missing_edd
    parser = Canql::Parser.new('all patients with missing edd')
    refute parser.valid?

    parser = Canql::Parser.new('all patients with missing expected delivery date')
    refute parser.valid?
  end

  def test_should_not_filter_on_missing_booking_hospital
    parser = Canql::Parser.new('all patients with missing booking hospital')
    refute parser.valid?
  end

  def test_should_not_filter_on_populated_edd
    parser = Canql::Parser.new('all patients with populated edd')
    refute parser.valid?

    parser = Canql::Parser.new('all patients with populated expected delivery date')
    refute parser.valid?
  end

  def test_should_not_filter_on_populated_booking_hospital
    parser = Canql::Parser.new('all patients with populated booking hospital')
    refute parser.valid?
  end

  def test_should_not_filter_on_mother
    parser = Canql::Parser.new('all patients with mother with populated dob')
    refute parser.valid?
  end
end
