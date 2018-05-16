# frozen_string_literal: true

require 'test_helper'
require 'anomaly_test_helper'

# case anomaly tests
class AnomalyTest < Minitest::Test
  include AnomalyTestHelper

  def test_should_filter_by_anomaly
    parser = Canql::Parser.new('all cases with anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0, 'exists' => { Canql::EQUALS => true }
  end

  def test_should_filter_by_prenatal_anomaly
    parser = Canql::Parser.new('all cases with prenatal anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_postnatal_anomaly
    parser = Canql::Parser.new('all cases with postnatal anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_no_anomaly
    parser = Canql::Parser.new('all cases with no anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0, 'exists' => { Canql::EQUALS => false }
  end

  def test_should_filter_by_no_postnatal_anomaly
    parser = Canql::Parser.new('all cases with no postnatal anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => false },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_no_postnatal_anomaly_and_prenatal_anomalies
    parser = Canql::Parser.new('all cases with no postnatal anomalies and prenatal anomalies')
    assert parser.valid?

    assert_anomaly_count parser, 2
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => false },
                          'type' => { Canql::EQUALS => 'postnatal' }
    assert_anomaly_values parser, 1,
                          'exists' => { Canql::EQUALS => true },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_no_prenatal_anomaly
    parser = Canql::Parser.new('all cases with no prenatal anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => false },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end

  def test_should_filter_by_some_anomaly
    parser = Canql::Parser.new('all cases with some anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0, 'exists' => { Canql::EQUALS => true }
  end

  def test_should_filter_by_some_postnatal_anomaly
    parser = Canql::Parser.new('all cases with some postnatal anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'type' => { Canql::EQUALS => 'postnatal' }
  end

  def test_should_filter_by_some_prenatal_anomaly
    parser = Canql::Parser.new('all cases with some prenatal anomalies')
    assert parser.valid?
    assert_anomaly_count parser, 1
    assert_anomaly_values parser, 0,
                          'exists' => { Canql::EQUALS => true },
                          'type' => { Canql::EQUALS => 'prenatal' }
  end
end
