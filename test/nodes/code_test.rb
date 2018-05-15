# frozen_string_literal: true

require 'test_helper'

# case anomaly code tests
class CodeTest < Minitest::Test
  def test_should_filter_by_sigle_code
    parser = Canql::Parser.new('all cases with q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.icd_code'])
  end

  def test_should_filter_by_multiple_codes_v1
    parser = Canql::Parser.new('all cases with q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.icd_code'])
  end

  def test_should_filter_by_multiple_codes_v2
    parser = Canql::Parser.new('all cases with q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.icd_code'])
  end

  def test_should_filter_by_multiple_codes_v3
    parser = Canql::Parser.new('all cases with q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.exists'])
    assert_equal({ Canql::BEGINS => %w[Q1 Q2 Q3] }, parser.meta_data['anomaly.icd_code'])
  end

  def test_should_filter_by_sigle_prenatal_code
    parser = Canql::Parser.new('all cases with prenatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.prenatal.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.prenatal.icd_code'])
  end

  def test_should_filter_by_multiple_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.prenatal.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.prenatal.icd_code'])
  end

  def test_should_filter_by_multiple_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.prenatal.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.prenatal.icd_code'])
  end

  def test_should_filter_by_multiple_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.prenatal.exists'])
    assert_equal({ Canql::BEGINS => %w[Q1 Q2 Q3] }, parser.meta_data['anomaly.prenatal.icd_code'])
  end

  def test_should_filter_by_sigle_postnatal_code
    parser = Canql::Parser.new('all cases with postnatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.postnatal.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.postnatal.icd_code'])
  end

  def test_should_filter_by_multiple_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.postnatal.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.postnatal.icd_code'])
  end

  def test_should_filter_by_multiple_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.postnatal.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.postnatal.icd_code'])
  end

  def test_should_filter_by_multiple_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.postnatal.exists'])
    assert_equal({ Canql::BEGINS => %w[Q1 Q2 Q3] }, parser.meta_data['anomaly.postnatal.icd_code'])
  end

  def test_should_filter_by_sigle_suspected_code
    parser = Canql::Parser.new('all cases with suspected q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.suspected.icd_code'])
  end

  def test_should_filter_by_multiple_suspected_codes_v1
    parser = Canql::Parser.new('all cases with suspected q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.suspected.icd_code'])
  end

  def test_should_filter_by_multiple_suspected_codes_v2
    parser = Canql::Parser.new('all cases with suspected q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.suspected.icd_code'])
  end

  def test_should_filter_by_multiple_suspected_codes_v3
    parser = Canql::Parser.new('all cases with suspected q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.exists'])
    assert_equal({ Canql::BEGINS => %w[Q1 Q2 Q3] }, parser.meta_data['anomaly.suspected.icd_code'])
  end

  def test_should_filter_by_sigle_suspected_prenatal_code
    parser = Canql::Parser.new('all cases with suspected prenatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => ['Q2'] },
      parser.meta_data['anomaly.suspected.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_suspected_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with suspected prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.suspected.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_suspected_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with suspected prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.suspected.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_suspected_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with suspected prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q1 Q2 Q3] },
      parser.meta_data['anomaly.suspected.prenatal.icd_code']
    )
  end

  def test_should_filter_by_sigle_suspected_postnatal_code
    parser = Canql::Parser.new('all cases with suspected postnatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => ['Q2'] },
      parser.meta_data['anomaly.suspected.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_suspected_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with suspected postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.suspected.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_suspected_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with suspected postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.suspected.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_suspected_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with suspected postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q1 Q2 Q3] },
      parser.meta_data['anomaly.suspected.postnatal.icd_code']
    )
  end

  def test_should_filter_by_sigle_confirmed_code
    parser = Canql::Parser.new('all cases with confirmed q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.confirmed.icd_code'])
  end

  def test_should_filter_by_multiple_confirmed_codes_v1
    parser = Canql::Parser.new('all cases with confirmed q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.confirmed.icd_code'])
  end

  def test_should_filter_by_multiple_confirmed_codes_v2
    parser = Canql::Parser.new('all cases with confirmed q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.confirmed.icd_code'])
  end

  def test_should_filter_by_multiple_confirmed_codes_v3
    parser = Canql::Parser.new('all cases with confirmed q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.exists'])
    assert_equal({ Canql::BEGINS => %w[Q1 Q2 Q3] }, parser.meta_data['anomaly.confirmed.icd_code'])
  end

  def test_should_filter_by_sigle_confirmed_prenatal_code
    parser = Canql::Parser.new('all cases with confirmed prenatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => ['Q2'] },
      parser.meta_data['anomaly.confirmed.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_confirmed_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with confirmed prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.confirmed.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_confirmed_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with confirmed prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.confirmed.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_confirmed_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with confirmed prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q1 Q2 Q3] },
      parser.meta_data['anomaly.confirmed.prenatal.icd_code']
    )
  end

  def test_should_filter_by_sigle_confirmed_postnatal_code
    parser = Canql::Parser.new('all cases with confirmed postnatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => ['Q2'] },
      parser.meta_data['anomaly.confirmed.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_confirmed_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with confirmed postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.confirmed.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_confirmed_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with confirmed postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.confirmed.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_confirmed_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with confirmed postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.confirmed.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q1 Q2 Q3] },
      parser.meta_data['anomaly.confirmed.postnatal.icd_code']
    )
  end

  def test_should_filter_by_sigle_probable_code
    parser = Canql::Parser.new('all cases with probable q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.probable.icd_code'])
  end

  def test_should_filter_by_multiple_probable_codes_v1
    parser = Canql::Parser.new('all cases with probable q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.probable.icd_code'])
  end

  def test_should_filter_by_multiple_probable_codes_v2
    parser = Canql::Parser.new('all cases with probable q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.exists'])
    assert_equal({ Canql::BEGINS => %w[Q2 Q3] }, parser.meta_data['anomaly.probable.icd_code'])
  end

  def test_should_filter_by_multiple_probable_codes_v3
    parser = Canql::Parser.new('all cases with probable q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.exists'])
    assert_equal({ Canql::BEGINS => %w[Q1 Q2 Q3] }, parser.meta_data['anomaly.probable.icd_code'])
  end

  def test_should_filter_by_sigle_probable_prenatal_code
    parser = Canql::Parser.new('all cases with probable prenatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => ['Q2'] },
      parser.meta_data['anomaly.probable.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_probable_prenatal_codes_v1
    parser = Canql::Parser.new('all cases with probable prenatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.probable.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_probable_prenatal_codes_v2
    parser = Canql::Parser.new('all cases with probable prenatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.probable.prenatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_probable_prenatal_codes_v3
    parser = Canql::Parser.new('all cases with probable prenatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q1 Q2 Q3] },
      parser.meta_data['anomaly.probable.prenatal.icd_code']
    )
  end

  def test_should_filter_by_sigle_probable_postnatal_code
    parser = Canql::Parser.new('all cases with probable postnatal q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => ['Q2'] },
      parser.meta_data['anomaly.probable.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_probable_postnatal_codes_v1
    parser = Canql::Parser.new('all cases with probable postnatal q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.probable.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_probable_postnatal_codes_v2
    parser = Canql::Parser.new('all cases with probable postnatal q2, q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q2 Q3] },
      parser.meta_data['anomaly.probable.postnatal.icd_code']
    )
  end

  def test_should_filter_by_multiple_probable_postnatal_codes_v3
    parser = Canql::Parser.new('all cases with probable postnatal q1, q2 and q3 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.probable.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q1 Q2 Q3] },
      parser.meta_data['anomaly.probable.postnatal.icd_code']
    )
  end

  def test_should_filter_by_no_sigle_code
    parser = Canql::Parser.new('all cases with no q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['anomaly.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.icd_code'])
  end

  def test_should_filter_by_some_sigle_code
    parser = Canql::Parser.new('all cases with some q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.icd_code'])
  end

  def test_should_filter_by_no_sigle_suspected_code
    parser = Canql::Parser.new('all cases with no suspected q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['anomaly.suspected.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.suspected.icd_code'])
  end

  def test_should_filter_by_some_sigle_suspected_code
    parser = Canql::Parser.new('all cases with some suspected q2 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.exists'])
    assert_equal({ Canql::BEGINS => ['Q2'] }, parser.meta_data['anomaly.suspected.icd_code'])
  end

  def test_should_filter_with_multiple_anomaly_types
    parser = Canql::Parser.new('all cases with suspected prenatal q2 anomalies and '\
                               'no confirmed postnatal q3 and q4 anomalies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => true }, parser.meta_data['anomaly.suspected.prenatal.exists'])
    assert_equal(
      { Canql::BEGINS => ['Q2'] },
      parser.meta_data['anomaly.suspected.prenatal.icd_code']
    )
    assert_equal({ Canql::EQUALS => false }, parser.meta_data['anomaly.confirmed.postnatal.exists'])
    assert_equal(
      { Canql::BEGINS => %w[Q3 Q4] },
      parser.meta_data['anomaly.confirmed.postnatal.icd_code']
    )
  end
end
