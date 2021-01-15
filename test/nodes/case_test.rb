# frozen_string_literal: true

require 'test_helper'

# case host patient tests
class CaseTest < Minitest::Test
  def test_should_filter_by_male_gender
    parser = Canql::Parser.new('all male cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '1' }, parser.meta_data['patient.sex'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_female_gender
    parser = Canql::Parser.new('all female cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '2' }, parser.meta_data['patient.sex'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_stillbirth_outcome
    parser = Canql::Parser.new('all stillborn cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'stillborn' }, parser.meta_data['patient.outcome'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_livebirth_outcome
    parser = Canql::Parser.new('all liveborn cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'liveborn' }, parser.meta_data['patient.outcome'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_miscarriage_outcome
    parser = Canql::Parser.new('all miscarried cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'miscarried' }, parser.meta_data['patient.outcome'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_top_outcome
    parser = Canql::Parser.new('all terminated cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'terminated' }, parser.meta_data['patient.outcome'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_primary_patient
    parser = Canql::Parser.new('all primary cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'primary' }, parser.meta_data['patient.primacy'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_alias_patient
    parser = Canql::Parser.new('all alias cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'alias' }, parser.meta_data['patient.primacy'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_eurocat_category
    parser = Canql::Parser.new('all eurocat cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'eurocat' }, parser.meta_data['patient.category'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_eurocat_red_category
    parser = Canql::Parser.new('all eurocat red cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'eurocat_red' }, parser.meta_data['patient.category'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_eurocat_amber_category
    parser = Canql::Parser.new('all eurocat amber cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'eurocat_amber' }, parser.meta_data['patient.category'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_eurocat_green_category
    parser = Canql::Parser.new('all eurocat green cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'eurocat_green' }, parser.meta_data['patient.category'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_eurocat_amber_and_green_category
    parser = Canql::Parser.new('all eurocat amber and green cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'eurocat_amber_green' }, parser.meta_data['patient.category'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_eurocat_red_and_amber_category
    parser = Canql::Parser.new('all eurocat red and amber cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'eurocat_red_amber' }, parser.meta_data['patient.category'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_on_specific_edd
    parser = Canql::Parser.new('all cases expected on 20/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => %w[2015-06-20 2015-06-20] },
                 parser.meta_data['patient.expecteddeliverydate'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_on_edd_range
    parser = Canql::Parser.new('all cases expected between 20/06/2015 and 25/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => %w[2015-06-20 2015-06-25] },
                 parser.meta_data['patient.expecteddeliverydate'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_on_edd_word_range
    parser = Canql::Parser.new('all cases expected between today and tomorrow')
    assert parser.valid?
    today = Date.today
    tomorrow = today + 1
    assert_equal(
      { Canql::LIMITS => [today.strftime('%Y-%m-%d'), tomorrow.strftime('%Y-%m-%d')] },
      parser.meta_data['patient.expecteddeliverydate']
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_fields
    parser = Canql::Parser.new('all cases with missing delivery postcode, date of birth')
    parser_v2 = Canql::Parser.new('all cases with missing booking postcode and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[delivery_postcode birthdate]
    assert_array_includes parser_v2.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[booking_postcode birthdate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_place_of_delivery
    parser = Canql::Parser.new('all cases with missing place of delivery')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[placeofdelivery]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_screening_status
    parser = Canql::Parser.new('all cases with missing screening status')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[screeningstatus]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_vital_status_date
    parser = Canql::Parser.new('all cases with missing date of vital status')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[dateofvitalstatus]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_populated_vital_status_date
    parser = Canql::Parser.new('all cases with populated date of vital status')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[dateofvitalstatus]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_mothers_by_missing_vital_status_date
    parser = Canql::Parser.new('all cases with mother missing date of vital status')
    assert parser.valid?
    assert_array_includes parser.meta_data['mother.fields_missing'][Canql::EQUALS],
                          %w[dateofvitalstatus]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_mothers_by_populated_vital_status_date
    parser = Canql::Parser.new('all cases with mother populated date of vital status')
    assert parser.valid?
    assert_array_includes parser.meta_data['mother.fields_populated'][Canql::EQUALS],
                          %w[dateofvitalstatus]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_fetuses_at_deliver
    parser = Canql::Parser.new('all cases with missing number of fetuses at delivery')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[numoffetusesatdelivery]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_populated_fetuses_at_deliver
    parser = Canql::Parser.new('all cases with populated number of fetuses at delivery')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[numoffetusesatdelivery]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_malformed_in_set
    parser = Canql::Parser.new('all cases with missing malformed in set')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[malformedinset]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_populated_malformed_in_set
    parser = Canql::Parser.new('all cases with populated malformed in set')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[malformedinset]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_gestation_at_delivery
    parser = Canql::Parser.new('all cases with missing gestation at delivery')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[gestationallength]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_populated_gestation_at_delivery
    parser = Canql::Parser.new('all cases with populated gestation at delivery')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[gestationallength]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_booking_date
    parser = Canql::Parser.new('all cases with missing booking date')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[firstbookingdate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_populated_booking_date
    parser = Canql::Parser.new('all cases with populated booking date')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[firstbookingdate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_populated_fields
    parser = Canql::Parser.new('all cases with fields delivery postcode, date of birth')
    parser_v2 = Canql::Parser.new('all cases with tests and fields booking postcode and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[delivery_postcode birthdate]
    assert_array_includes parser_v2.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[booking_postcode birthdate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_mother_fields
    parser = Canql::Parser.new('all cases with mother with missing nhs number, date of birth')
    parser_v2 = Canql::Parser.new('all cases with mother with missing nhs number and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['mother.fields_missing'][Canql::EQUALS],
                          %w[nhsnumber birthdate]
    assert_array_includes parser_v2.meta_data['mother.fields_missing'][Canql::EQUALS],
                          %w[nhsnumber birthdate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_mother_fields_v2
    parser = Canql::Parser.new('all cases with mother missing nhs number, date of birth')
    parser_v2 = Canql::Parser.new('all cases with mother missing nhs number and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['mother.fields_missing'][Canql::EQUALS],
                          %w[nhsnumber birthdate]
    assert_array_includes parser_v2.meta_data['mother.fields_missing'][Canql::EQUALS],
                          %w[nhsnumber birthdate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_populated_mother_fields
    parser = Canql::Parser.new('all cases with mother with fields nhs number, date of birth')
    parser_v2 = Canql::Parser.new('all cases with mother with fields nhs number and date of birth')
    assert parser.valid?
    assert_array_includes parser.meta_data['mother.fields_populated'][Canql::EQUALS],
                          %w[nhsnumber birthdate]
    assert_array_includes parser_v2.meta_data['mother.fields_populated'][Canql::EQUALS],
                          %w[nhsnumber birthdate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_dob_alias_valid
    query1 = 'all babies with missing date of birth'
    parser = Canql::Parser.new(query1)
    message = "That's a reference test for 'dob' alias, if this fails,\
               something is wrong!!!"
    assert(parser.valid?, message)

    query1 = 'all babies with missing dob'
    parser = Canql::Parser.new(query1)
    correct = base_meta_data.merge(
      'patient.fields_missing' => { 'equals' => ['birthdate'] }
    )
    message = '\'dob\' should be a valid alias for \'date of birth\'!'
    assert(parser.valid?, message)
    assert_equal(correct, parser.meta_data, message)
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_dob_alias_query
    query1 = 'all babies with missing delivery postcode, date of birth'
    query2 = 'all babies with missing delivery postcode, dob'
    parser1 = Canql::Parser.new(query1)
    parser2 = Canql::Parser.new(query2)
    message = '\'dob\' doesn\'t work as an alias of \'date of birth\'!'
    assert parser1.valid?
    assert parser2.valid?
    assert_equal(parser1.meta_data, parser2.meta_data, message)

    query1 = "first 27 male liveborn thames cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing booking postcode and date of birth \
      and qa action and unprocessed paediatric records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields nhs number"
    query2 = "first 27 male liveborn thames cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing booking postcode and dob \
      and qa action and unprocessed paediatric records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields nhs number"
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

  def test_should_not_filter_for_field_existance_on_nonmother_field
    parser = Canql::Parser.new('all cases with mother with populated outcome')
    refute parser.valid?
  end

  def test_should_filter_on_missing_edd
    parser = Canql::Parser.new('all cases with missing edd')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[expecteddeliverydate]

    parser = Canql::Parser.new('all cases with missing expected delivery date')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[expecteddeliverydate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_on_missing_booking_hospital
    parser = Canql::Parser.new('all cases with missing booking hospital')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_missing'][Canql::EQUALS],
                          %w[booking_hospital]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_on_populated_edd
    parser = Canql::Parser.new('all cases with populated edd')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[expecteddeliverydate]

    parser = Canql::Parser.new('all cases with populated expected delivery date')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[expecteddeliverydate]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_on_populated_booking_hospital
    parser = Canql::Parser.new('all cases with populated booking hospital')
    assert parser.valid?
    assert_array_includes parser.meta_data['patient.fields_populated'][Canql::EQUALS],
                          %w[booking_hospital]
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_not_filter_on_missing_edd_on_mother
    parser = Canql::Parser.new('all cases with mother with missing edd')
    refute parser.valid?

    parser = Canql::Parser.new('all cases with mother with missing expected delivery date')
    refute parser.valid?
  end

  def test_should_not_filter_on_missing_booking_hospital_on_mother
    parser = Canql::Parser.new('all cases with mother with missing booking hospital')
    refute parser.valid?
  end

  def test_should_not_filter_on_populated_edd_on_mother
    parser = Canql::Parser.new('all cases with mother with populated edd')
    refute parser.valid?

    parser = Canql::Parser.new('all cases with mother with populated expected delivery date')
    refute parser.valid?
  end
end
