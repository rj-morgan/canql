# frozen_string_literal: true

require 'test_helper'

# main entry point tests (For patient results)
class MainPatientTest < Minitest::Test
  def test_should_not_filter_all_tumours
    parser = Canql::Parser.new('all patients')
    assert parser.valid?
    assert_instance_of Hash, parser.meta_data
    assert_equal 1, parser.meta_data.count
    assert_equal base_meta_data(:patient), parser.meta_data
    assert_nil parser.failure_reason
  end

  def test_should_filter_by_record_count
    parser = Canql::Parser.new('first 27 patients')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 27 }, parser.meta_data['limit'])
  end

  def test_fails_for_unknown_result_type
    parser = Canql::Parser.new('all cabbages')
    refute parser.valid?
  end
end
