# frozen_string_literal: true

require 'test_helper'
require 'anomaly_test_helper'

# case anomaly code tests
class CodeTest < Minitest::Test
  include AnomalyTestHelper

  def test_should_filter_by_sigle_code
    parser = Canql::Parser.new('all cases with q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] }
  end

  def test_should_filter_by_multiple_codes_v1
    parser = Canql::Parser.new('all cases with q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] }
  end

  def test_should_filter_by_multiple_codes_v2
    parser = Canql::Parser.new('all cases with q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] }
  end

  def test_should_filter_by_multiple_codes_v3
    parser = Canql::Parser.new('all cases with q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] }
  end

  def test_should_filter_by_sigle_prenatal_code
    parser = Canql::Parser.new('all cases with prenatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_sigle_postnatal_code
    parser = Canql::Parser.new('all cases with postnatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_sigle_suspected_code
    parser = Canql::Parser.new('all cases with suspected q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'suspected' }
  end

  def test_should_filter_by_multiple_suspected_codes_v1
    parser = Canql::Parser.new('all cases with suspected q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' }
  end

  def test_should_filter_by_multiple_suspected_codes_v2
    parser = Canql::Parser.new('all cases with suspected q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' }
  end

  def test_should_filter_by_multiple_suspected_codes_v3
    parser = Canql::Parser.new('all cases with suspected q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' }
  end

  def test_should_filter_by_sigle_suspected_prenatal_code
    parser = Canql::Parser.new('all cases with suspected prenatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_suspected_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with suspected prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_suspected_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with suspected prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_suspected_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with suspected prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_sigle_suspected_postnatal_code
    parser = Canql::Parser.new('all cases with suspected postnatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_suspected_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with suspected postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_suspected_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with suspected postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_suspected_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with suspected postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_sigle_confirmed_code
    parser = Canql::Parser.new('all cases with confirmed q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'confirmed' }
  end

  def test_should_filter_by_multiple_confirmed_codes_v1
    parser = Canql::Parser.new('all cases with confirmed q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' }
  end

  def test_should_filter_by_multiple_confirmed_codes_v2
    parser = Canql::Parser.new('all cases with confirmed q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' }
  end

  def test_should_filter_by_multiple_confirmed_codes_v3
    parser = Canql::Parser.new('all cases with confirmed q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' }
  end

  def test_should_filter_by_sigle_confirmed_prenatal_code
    parser = Canql::Parser.new('all cases with confirmed prenatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_confirmed_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with confirmed prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_confirmed_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with confirmed prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_confirmed_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with confirmed prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_sigle_confirmed_postnatal_code
    parser = Canql::Parser.new('all cases with confirmed postnatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_confirmed_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with confirmed postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_confirmed_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with confirmed postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_confirmed_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with confirmed postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_sigle_probable_code
    parser = Canql::Parser.new('all cases with probable q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'probable' }
  end

  def test_should_filter_by_multiple_probable_codes_v1
    parser = Canql::Parser.new('all cases with probable q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' }
  end

  def test_should_filter_by_multiple_probable_codes_v2
    parser = Canql::Parser.new('all cases with probable q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' }
  end

  def test_should_filter_by_multiple_probable_codes_v3
    parser = Canql::Parser.new('all cases with probable q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' }
  end

  def test_should_filter_by_sigle_probable_prenatal_code
    parser = Canql::Parser.new('all cases with probable prenatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_probable_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with probable prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_probable_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with probable prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_probable_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with probable prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_sigle_probable_postnatal_code
    parser = Canql::Parser.new('all cases with probable postnatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_probable_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with probable postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_probable_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with probable postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_probable_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with probable postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'probable' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_sigle_diagnosed_code
    parser = Canql::Parser.new('all cases with diagnosed q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'diagnosed' }
  end

  def test_should_filter_by_multiple_diagnosed_codes_v1
    parser = Canql::Parser.new('all cases with diagnosed q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' }
  end

  def test_should_filter_by_multiple_diagnosed_codes_v2
    parser = Canql::Parser.new('all cases with diagnosed q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' }
  end

  def test_should_filter_by_multiple_diagnosed_codes_v3
    parser = Canql::Parser.new('all cases with diagnosed q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' }
  end

  def test_should_filter_by_sigle_diagnosed_prenatal_code
    parser = Canql::Parser.new('all cases with diagnosed prenatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_diagnosed_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with diagnosed prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_diagnosed_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with diagnosed prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_multiple_diagnosed_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with diagnosed prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_sigle_diagnosed_postnatal_code
    parser = Canql::Parser.new('all cases with diagnosed postnatal q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_diagnosed_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with diagnosed postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_diagnosed_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with diagnosed postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_multiple_diagnosed_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with diagnosed postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => %w[Q1 Q2 Q3] },
                          'status' => { Canql::EQUALS => 'diagnosed' },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_no_sigle_code
    parser = Canql::Parser.new('all cases with no q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => false },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] }
  end

  def test_should_filter_by_some_sigle_code
    parser = Canql::Parser.new('all cases with some q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] }
  end

  def test_should_filter_by_no_sigle_suspected_code
    parser = Canql::Parser.new('all cases with no suspected q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => false },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] }
  end

  def test_should_filter_by_some_sigle_suspected_code
    parser = Canql::Parser.new('all cases with some suspected q2 anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] }
  end

  def test_should_filter_with_multiple_anomaly_types
    parser = Canql::Parser.new('all cases with suspected prenatal q2 anomalies and '\
                               'no confirmed postnatal q3 and q4 anomalies')
    assert parser.valid?

    assert_anomaly_count parser, 2
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'status' => { Canql::EQUALS => 'suspected' },
                          'icd_codes' => { Canql::BEGINS => ['Q2'] },
                          'type' => { Canql::EQUALS => 'prenatal' }
    assert_anomaly_values parser, 1,
                          'exists' => { Canql::EQUALS => false },
                          'status' => { Canql::EQUALS => 'confirmed' },
                          'icd_codes' => { Canql::BEGINS => %w[Q3 Q4] },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end
end
