# frozen_string_literal: true

require 'test_helper'

# case test result grouups tests
class TestResultGroupsTest < Minitest::Test
  def test_should_filter_by_missing_required_fetal_medicine_test_result_group
    parser = Canql::Parser.new('all cases with missing required fetal medicine')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'fetal_medicine' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_fetal_medicine_test_result_group
    parser = Canql::Parser.new('all cases with missing fetal medicine')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'fetal_medicine' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_required_dating_test_result_group
    parser = Canql::Parser.new('all cases with missing required dating')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'dating' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_dating_test_result_group
    parser = Canql::Parser.new('all cases with missing dating')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'dating' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_required_fetal_medicine_test_result_group
    parser = Canql::Parser.new('all cases with supplied required fetal medicine')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'fetal_medicine' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_fetal_medicine_test_result_group
    parser = Canql::Parser.new('all cases with supplied fetal medicine')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'fetal_medicine' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_required_dating_test_result_group
    parser = Canql::Parser.new('all cases with supplied required dating')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'dating' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_dating_test_result_group
    parser = Canql::Parser.new('all cases with supplied dating')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'dating' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_required_screening_test_result_group
    parser = Canql::Parser.new('all cases with missing required screening')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'screening' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_screening_test_result_group
    parser = Canql::Parser.new('all cases with missing screening')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'screening' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_required_anomaly_scan_test_result_group
    parser = Canql::Parser.new('all cases with missing required anomaly scan')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'anomaly_scan' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_anomaly_scan_test_result_group
    parser = Canql::Parser.new('all cases with missing anomaly scan')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => false },
                                    'group' => { Canql::EQUALS => 'anomaly_scan' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_required_screening_test_result_group
    parser = Canql::Parser.new('all cases with supplied required screening')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'screening' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_screening_test_result_group
    parser = Canql::Parser.new('all cases with supplied screening')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'screening' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_required_anomaly_scan_test_result_group
    parser = Canql::Parser.new('all cases with supplied required anomaly scan')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'anomaly_scan' },
                                    'required' => { Canql::EQUALS => true }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_supplied_anomaly_scan_test_result_group
    parser = Canql::Parser.new('all cases with supplied anomaly scan')
    assert parser.valid?
    assert_test_result_group_count parser, 1
    assert_test_result_group_values parser, 0,
                                    'exists' => { Canql::EQUALS => true },
                                    'group' => { Canql::EQUALS => 'anomaly_scan' },
                                    'required' => { Canql::EQUALS => false }
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_required_screening_acceptance_status
    parser = Canql::Parser.new('all cases with missing required screening acceptance status')

    assert parser.valid?

    assert_test_accesptance_count parser, 1
    assert_test_acceptance_values(
      parser, 0,
      'exists' => { Canql::EQUALS => false },
      'acceptance' => { Canql::EQUALS => 'screening_acceptance_status' },
      'required' => { Canql::EQUALS => true }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_non_required_screening_acceptance_status
    parser = Canql::Parser.new('all cases with missing screening acceptance status')

    assert parser.valid?

    assert_test_accesptance_count parser, 1
    assert_test_acceptance_values(
      parser, 0,
      'exists' => { Canql::EQUALS => false },
      'acceptance' => { Canql::EQUALS => 'screening_acceptance_status' },
      'required' => { Canql::EQUALS => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_required_anomaly_scan_acceptance_status
    parser = Canql::Parser.new('all cases with missing required anomaly scan acceptance status')

    assert parser.valid?

    assert_test_accesptance_count parser, 1
    assert_test_acceptance_values(
      parser, 0,
      'exists' => { Canql::EQUALS => false },
      'acceptance' => { Canql::EQUALS => 'anomaly_scan_acceptance_status' },
      'required' => { Canql::EQUALS => true }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_missing_non_required_anomaly_scan_acceptance_status
    parser = Canql::Parser.new('all cases with missing anomaly scan acceptance status')

    assert parser.valid?

    assert_test_accesptance_count parser, 1
    assert_test_acceptance_values(
      parser, 0,
      'exists' => { Canql::EQUALS => false },
      'acceptance' => { Canql::EQUALS => 'anomaly_scan_acceptance_status' },
      'required' => { Canql::EQUALS => false }
    )
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_not_allow_supplied_acceptance
    parser = Canql::Parser.new('all cases with supplied required screening acceptance status')
    refute parser.valid?

    parser = Canql::Parser.new('all cases with supplied screening acceptance status')
    refute parser.valid?

    parser = Canql::Parser.new('all cases with supplied requiored anomaly scan acceptance status')
    refute parser.valid?

    parser = Canql::Parser.new('all cases with supplied anomaly scan acceptance status')
    refute parser.valid?
  end

  private

  def assert_test_acceptance_values(parser, index = 0, expected = {})
    assert_dir_block_values(parser, 'test_acceptances', %w[exists acceptance required], index, expected)
  end

  def assert_test_accesptance_count(parser, numder_of_blocks)
    assert_dir_block_count(parser, 'test_acceptances', numder_of_blocks)
  end

  def assert_test_result_group_values(parser, index = 0, expected = {})
    assert_dir_block_values(parser, 'test_result_groups', %w[exists group required], index, expected)
  end

  def assert_test_result_group_count(parser, numder_of_blocks)
    assert_dir_block_count(parser, 'test_result_groups', numder_of_blocks)
  end
end
