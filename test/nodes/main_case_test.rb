# frozen_string_literal: true

require 'test_helper'

# main entry point tests
class MainCaseTest < Minitest::Test
  def test_should_not_filter_all_tumours
    parser = Canql::Parser.new('all cases')
    assert parser.valid?
    assert_instance_of Hash, parser.meta_data
    assert_equal 1, parser.meta_data.count
    assert_equal base_meta_data, parser.meta_data
    assert_nil parser.failure_reason
  end

  def test_should_filter_by_record_count
    parser = Canql::Parser.new('first 27 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 27 }, parser.meta_data['limit'])
  end

  def test_should_be_able_to_use_babies_instead_of_cases
    parser = Canql::Parser.new('first 27 babies')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 27 }, parser.meta_data['limit'])
  end
end
