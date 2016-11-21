# frozen_string_literal: true
require 'test_helper'

# case test results tests
class TestResultsTest < Minitest::Test
  def test_should_filter_by_test_result
    parser = Canql::Parser.new('all cases with tests')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['testresults.exists'])
  end

  def test_should_filter_by_prenatal_test_result
    parser = Canql::Parser.new('all cases with prenatal tests')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['testresults.prenatal.exists'])
  end

  def test_should_filter_by_postnatal_test_result
    parser = Canql::Parser.new('all cases with postnatal tests')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['testresults.postnatal.exists'])
  end

  def test_should_filter_by_no_test_result
    parser = Canql::Parser.new('all cases with no tests')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['testresults.exists'])
  end

  def test_should_filter_by_no_postnatal_test_result
    parser = Canql::Parser.new('all cases with no postnatal tests')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['testresults.postnatal.exists'])
  end

  def test_should_filter_by_no_prenatal_test_result
    parser = Canql::Parser.new('all cases with no prenatal tests')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['testresults.prenatal.exists'])
  end

  def test_should_filter_by_some_test_result
    parser = Canql::Parser.new('all cases with some tests')
    assert parser.valid?, parser.failure_reason
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['testresults.exists'])
  end

  def test_should_filter_by_some_postnatal_test_result
    parser = Canql::Parser.new('all cases with some postnatal tests')
    assert parser.valid?, 'query is not valid'
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['testresults.postnatal.exists'])
  end

  def test_should_filter_by_some_prenatal_test_result
    parser = Canql::Parser.new('all cases with some prenatal tests')
    assert parser.valid?, 'query is not valid'
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['testresults.prenatal.exists'])
  end
end
