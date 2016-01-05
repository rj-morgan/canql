require 'test_helper'

# main entry point tests
class MainTest < Minitest::Test
  def test_should_not_filter_all_tumours
    parser = Canql::Parser.new('all cases')
    assert parser.valid?
    assert_instance_of Hash, parser.meta_data
    assert parser.meta_data.empty?
    assert_nil parser.failure_reason
  end

  def test_should_filter_by_record_count
    parser = Canql::Parser.new('first 27 cases')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 27 }, parser.meta_data['limit'])
  end
end
