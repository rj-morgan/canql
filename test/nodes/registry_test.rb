# frozen_string_literal: true

require 'test_helper'

# tumour host registry tests
class RegistryTest < Minitest::Test
  def test_should_filter_by_registry_code
    parser = Canql::Parser.new('all 68 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '68' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_thames_abbreviation
    parser = Canql::Parser.new('all thames cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '68' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_thames_valley_abbreviation
    parser = Canql::Parser.new('all thames valley cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '68' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_london_abbreviation
    parser = Canql::Parser.new('all london cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '95' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_london_and_south_east_abbreviation
    parser = Canql::Parser.new('all london and south east cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '95' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_east_mids_abbreviation
    parser = Canql::Parser.new('all east mids cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '72' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_east_midlands_abbreviation
    parser = Canql::Parser.new('all east midlands cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '72' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_east_midlands_and_south_yorkshire_abbreviation
    parser = Canql::Parser.new('all east midlands and south yorkshire cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '72' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_yorkshire_abbreviation
    parser = Canql::Parser.new('all yorkshire cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '93' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_north_east_abbreviation
    parser = Canql::Parser.new('all north east cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '73' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_north_west_abbreviation
    parser = Canql::Parser.new('all north west cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '94' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_west_mids_abbreviation
    parser = Canql::Parser.new('all west mids cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '99' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_west_midlands_abbreviation
    parser = Canql::Parser.new('all west midlands cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '99' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_south_west_abbreviation
    parser = Canql::Parser.new('all south west cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '84' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_wessex_abbreviation
    parser = Canql::Parser.new('all wessex cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '70' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_east_abbreviation
    parser = Canql::Parser.new('all east cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '96' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_east_of_england_abbreviation
    parser = Canql::Parser.new('all east of england cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '96' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_limbo_abbreviation
    parser = Canql::Parser.new('all limbo cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '01' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_england_abbreviation
    parser = Canql::Parser.new('all england cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '00' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_thames_code
    parser = Canql::Parser.new('all 68 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '68' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_east_mids_code
    parser = Canql::Parser.new('all 72 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '72' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_yorkshire_code
    parser = Canql::Parser.new('all 93 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '93' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_north_east_code
    parser = Canql::Parser.new('all 73 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '73' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_north_west_code
    parser = Canql::Parser.new('all 94 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '94' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_west_mids_code
    parser = Canql::Parser.new('all 99 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '99' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_south_west_code
    parser = Canql::Parser.new('all 84 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '84' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_wessex_code
    parser = Canql::Parser.new('all 70 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '70' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_london_code
    parser = Canql::Parser.new('all 95 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '95' }, parser.meta_data['patient.registry'])
  end

  def test_should_filter_by_east_code
    parser = Canql::Parser.new('all 96 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => '96' }, parser.meta_data['patient.registry'])
  end
end
