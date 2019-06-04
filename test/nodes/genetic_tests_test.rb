# frozen_string_literal: true

require 'test_helper'

# case test results tests
class GeneticTest < Minitest::Test
  def test_should_filter_by_genetic_test
    parser = Canql::Parser.new('all cases with genetic tests')
    assert parser.valid?
    assert_genetic_test_count parser, 1
    assert_genetic_test_values parser, 0, 'exists' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  # As the genetic test clause is the same for patient & case
  # only this test is specifically on 'patients'.  All other
  # anomaly clauses can be assumed to be true for patients as
  # well as cases
  def test_should_filter_by_genetic_test_on_patient_results
    parser = Canql::Parser.new('all patients with genetic tests')
    assert parser.valid?
    assert_genetic_test_count parser, 1
    assert_genetic_test_values parser, 0, 'exists' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_no_genetic_test
    parser = Canql::Parser.new('all cases with no genetic tests')
    assert parser.valid?
    assert_genetic_test_count parser, 1
    assert_genetic_test_values parser, 0, 'exists' => { Canql::EQUALS => false }
  end

  def test_should_filter_by_some_genetic_test
    parser = Canql::Parser.new('all cases with some genetic tests')
    assert parser.valid?, parser.failure_reason
    assert_genetic_test_count parser, 1
    assert_genetic_test_values parser, 0, 'exists' => { Canql::EQUALS => true }
  end

  private

  def assert_genetic_test_values(parser, index = 0, expected = {})
    assert_dir_block_values(parser, 'genetic_tests', %w[exists], index, expected)
  end

  def assert_genetic_test_count(parser, numder_of_blocks)
    assert_dir_block_count(parser, 'genetic_tests', numder_of_blocks)
  end
end
