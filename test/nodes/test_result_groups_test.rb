# frozen_string_literal: true

require 'test_helper'

# case test result grouups tests
class TestResultGroupsTest < Minitest::Test
  def test_should_filter_by_missing_screening_test_result_group
    parser = Canql::Parser.new('all cases with missing required screening')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'screening' }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_anomaly_scan_test_result_group
    parser = Canql::Parser.new('all cases with missing required anomaly scan')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'anomaly_scan' }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  private

  def assert_test_result_group_values(parser, index = 0, expected = {})
    assert_dir_block_values(parser, 'test_result_groups', %w[exists group], index, expected)
  end

  def assert_test_result_group_count(parser, numder_of_blocks)
    assert_dir_block_count(parser, 'test_result_groups', numder_of_blocks)
  end
end
