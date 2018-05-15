# frozen_string_literal: true

require 'test_helper'

# case anomaly tests
class AnomalyTest < Minitest::Test
  def test_should_filter_by_anomaly
    parser = Canql::Parser.new('all cases with anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.exists'])
  end

  def test_should_filter_by_prenatal_anomaly
    parser = Canql::Parser.new('all cases with prenatal anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.prenatal.exists'])
  end

  def test_should_filter_by_postnatal_anomaly
    parser = Canql::Parser.new('all cases with postnatal anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.postnatal.exists'])
  end

  def test_should_filter_by_no_anomaly
    parser = Canql::Parser.new('all cases with no anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['anomaly.exists'])
  end

  def test_should_filter_by_no_postnatal_anomaly
    parser = Canql::Parser.new('all cases with no postnatal anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['anomaly.postnatal.exists'])
  end

  def test_should_filter_by_no_postnatal_anomaly_and_prenatal_anomalies
    parser = Canql::Parser.new('all cases with no postnatal anomalies and prenatal anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['anomaly.postnatal.exists'])
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.prenatal.exists'])
  end

  def test_should_filter_by_no_prenatal_anomaly
    parser = Canql::Parser.new('all cases with no prenatal anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['anomaly.prenatal.exists'])
  end

  def test_should_filter_by_some_anomaly
    parser = Canql::Parser.new('all cases with some anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.exists'])
  end

  def test_should_filter_by_some_postnatal_anomaly
    parser = Canql::Parser.new('all cases with some postnatal anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.postnatal.exists'])
  end

  def test_should_filter_by_some_prenatal_anomaly
    parser = Canql::Parser.new('all cases with some prenatal anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.prenatal.exists'])
  end
end
