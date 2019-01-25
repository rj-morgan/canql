# frozen_string_literal: true

require 'test_helper'

# registration action and unprocessed record tests
class PerinatalHospitalTest < Minitest::Test
  def test_should_filter_by_booking_hosital_code
    parser = Canql::Parser.new('all cases with booking at hospital RGT01')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'RGT01' }, parser.meta_data['booking.providercode'])
  end

  def test_should_filter_by_booking_trust_code
    parser = Canql::Parser.new('all cases with booking at trust RGT')
    assert parser.valid?
    assert_equal({ Canql::BEGINS => 'RGT' }, parser.meta_data['booking.providercode'])
  end

  def test_should_filter_by_booking_hosital_name
    parser = Canql::Parser.new('all cases with booking at addenbrookes hospital')
    assert parser.valid?
    assert_equal(
      { Canql::BEGINS => 'ADDENBROOKES', :interval => 26...47 },
      parser.meta_data['booking.providername']
    )
  end

  def test_should_filter_by_booking_trust_name
    parser = Canql::Parser.new('all cases with booking at addenbrookes trust')
    assert parser.valid?
    assert_equal(
      { Canql::BEGINS => 'ADDENBROOKES', :interval => 26...44 },
      parser.meta_data['booking.providername']
    )
  end

  def test_should_filter_by_delivery_hosital_code
    parser = Canql::Parser.new('all cases with delivery at hospital RGT01')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'RGT01' }, parser.meta_data['delivery.providercode'])
  end

  def test_should_filter_by_delivery_trust_code
    parser = Canql::Parser.new('all cases with delivery at trust RGT')
    assert parser.valid?
    assert_equal({ Canql::BEGINS => 'RGT' }, parser.meta_data['delivery.providercode'])
  end

  def test_should_filter_by_delivery_hosital_name
    parser = Canql::Parser.new('all cases with delivery at addenbrookes hospital')
    assert parser.valid?
    assert_equal(
      { Canql::BEGINS => 'ADDENBROOKES', :interval => 27...48 },
      parser.meta_data['delivery.providername']
    )
  end

  def test_should_filter_by_delivery_trust_name
    parser = Canql::Parser.new('all cases with delivery at addenbrookes trust')
    assert parser.valid?
    assert_equal(
      { Canql::BEGINS => 'ADDENBROOKES', :interval => 27...45 },
      parser.meta_data['delivery.providername']
    )
  end
end
