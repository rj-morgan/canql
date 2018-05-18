# frozen_string_literal: true

require 'test_helper'

# case test results tests
class TestResultsTest < Minitest::Test
  def test_should_filter_by_test_result
    parser = Canql::Parser.new('all cases with tests')
    assert parser.valid?
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0, 'exists' => { Canql::EQUALS => true }
  end

  def test_should_filter_by_prenatal_test_result
    parser = Canql::Parser.new('all cases with prenatal tests')
    assert parser.valid?
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0,
                              'exists' => { Canql::EQUALS => true },
                              'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_postnatal_test_result
    parser = Canql::Parser.new('all cases with postnatal tests')
    assert parser.valid?
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0,
                              'exists' => { Canql::EQUALS => true },
                              'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_no_test_result
    parser = Canql::Parser.new('all cases with no tests')
    assert parser.valid?
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0, 'exists' => { Canql::EQUALS => false }
  end

  def test_should_filter_by_no_postnatal_test_result
    parser = Canql::Parser.new('all cases with no postnatal tests')
    assert parser.valid?
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0,
                              'exists' => { Canql::EQUALS => false },
                              'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_no_prenatal_test_result
    parser = Canql::Parser.new('all cases with no prenatal tests')
    assert parser.valid?
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0,
                              'exists' => { Canql::EQUALS => false },
                              'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_some_test_result
    parser = Canql::Parser.new('all cases with some tests')
    assert parser.valid?, parser.failure_reason
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0, 'exists' => { Canql::EQUALS => true }
  end

  def test_should_filter_by_some_postnatal_test_result
    parser = Canql::Parser.new('all cases with some postnatal tests')
    assert parser.valid?, 'query is not valid'
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0,
                              'exists' => { Canql::EQUALS => true },
                              'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_some_prenatal_test_result
    parser = Canql::Parser.new('all cases with some prenatal tests')
    assert parser.valid?, 'query is not valid'
    assert_test_result_count parser, 1
    assert_test_result_values parser, 0,
                              'exists' => { Canql::EQUALS => true },
                              'type' => { Canql::EQUALS => 'prenatal' }
  end

  private

  def assert_test_result_values(parser, index = 0, expected = {})
    assert_dir_block_values(parser, 'test_results', %w[exists type status icd_codes], index, expected)
  end

  def assert_test_result_count(parser, numder_of_blocks)
    assert_dir_block_count(parser, 'test_results', numder_of_blocks)
  end
end
