# frozen_string_literal: true
require 'test_helper'

# registration action and unprocessed record tests
class EBaseRecordsTest < Minitest::Test
  def test_should_filter_by_check_action
    parser = Canql::Parser.new('all cases with check action')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'CHECK' }, parser.meta_data['action.actioninitiated'])
  end

  def test_should_filter_by_action_hosital_code
    parser = Canql::Parser.new('all cases with search action at hospital RGT01')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::EQUALS => 'RGT01' }, parser.meta_data['action.providercode'])
  end

  def test_should_filter_by_action_hosital_name
    parser = Canql::Parser.new('all cases with search action at addenbrookes hospital')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::BEGINS => 'ADDENBROOKES', :interval => 32...53 },
                 parser.meta_data['action.providername'])
  end

  def test_should_filter_by_unprocessed_records
    parser = Canql::Parser.new('all cases with unprocessed records')
    assert parser.valid?
    assert_equal({ Canql::ALL => true }, parser.meta_data['unprocessed_records.sources'])
  end

  def test_should_filter_by_unprocessed_paediatric_records
    parser = Canql::Parser.new('all cases with unprocessed paediatric records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['PAEDIATRIC'] },
                 parser.meta_data['unprocessed_records.sources'])
  end
end
