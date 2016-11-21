# frozen_string_literal: true
require 'test_helper'

class ParserTest < Minitest::Test
  def test_canql_parser
    query = 'first 27 norcas male cases'
    parser = CanqlParser.new
    parser.parse(query.downcase)
  end

  def test_should_display_error_msg_on_empty_query
    parser = Canql::Parser.new('')
    refute parser.valid?
    assert_instance_of Hash, parser.meta_data
    assert parser.meta_data.empty?
    refute_nil parser.failure_reason
  end

  def test_should_display_error_msg_on_invalid_query
    parser = Canql::Parser.new('bob and simon')
    refute parser.valid?
    assert parser.meta_data.empty?
    refute_nil parser.failure_reason
  end

  def test_should_cope_with_a_mixed_case_query
    parser = Canql::Parser.new('All Cases')
    assert parser.valid?
    assert parser.meta_data.empty?
    assert_nil parser.failure_reason
  end

  # advanced tests

  def test_should_combine_filters
    parser = Canql::Parser.new("first 27 male liveborn thames cases \
      expected between 20/06/2015 and 25/06/2015 \
      and born on 22/06/2015 and that died on 01/12/2015 \
      with prenatal anomalies \
      and postnatal tests and missing postcode and date of birth \
      and wait action and unprocessed paediatric records \
      and mother born between 01/10/1990 and 10/01/1999 \
      and who died on 01/01/2016 \
      with fields postcode and nhs number")
    assert parser.valid?
    assert_equal 15, parser.meta_data.count
    individual_queries = [
      'first 27 cases',
      'first 27 babies',
      'all male cases',
      'all male babies',
      'all cases expected between 20/06/2015 and 25/06/2015',
      'all babies expected between 20/06/2015 and 25/06/2015',
      'all liveborn cases',
      'all liveborn babies',
      'all 68 cases',
      'all 68 babies',
      'all thames cases',
      'all thames babies',
      'all cases with prenatal anomalies',
      'all cases with postnatal tests',
      'all babies with prenatal anomalies',
      'all babies with postnatal tests',
      'all babies with some postnatal tests',
      'all babies with some prenatal anomalies',
      'all cases with some postnatal tests',
      'all cases with some prenatal anomalies',
      'all cases with missing postcode and date of birth',
      'all cases with missing postcode, date of birth',
      'all babies with missing postcode and date of birth',
      'all babies with missing postcode, date of birth',
      'all cases with mother with fields postcode and nhs number',
      'all cases with mother with populated postcode and nhs number',
      'all cases with wait action and unprocessed paediatric records',
      'all cases born on 22/06/2015',
      'all babies born on 22/06/2015',
      'all cases delivered on 22/06/2015',
      'all babies delivered on 22/06/2015',
      'all cases with mother born between 01/10/1990 and 10/01/1999',
      'all babies with mother born between 01/10/1990 and 10/01/1999',
      'all cases with mother that died on 01/01/2016',
      'all cases who died on 01/12/2015'
    ]
    assert_meta_data_includes(parser, individual_queries)
  end
end
