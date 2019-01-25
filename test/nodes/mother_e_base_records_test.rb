# frozen_string_literal: true

require 'test_helper'

# registration action and unprocessed record on mothers tests
class MotherEBaseRecordsTest < Minitest::Test
  def test_should_filter_mothers_by_qa_action
    parser = Canql::Parser.new('all cases with mother with qa action')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'QA' }, parser.meta_data['action.mother.actioninitiated'])
  end

  def test_should_filter_mothers_by_action_hosital_code
    parser = Canql::Parser.new('all cases with mother with search action at hospital RGT01')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.mother.actioninitiated'])
    assert_equal({ Canql::EQUALS => 'RGT01' }, parser.meta_data['action.mother.providercode'])
  end

  def test_should_filter_mother_by_no_outstanding_actions
    parser = Canql::Parser.new('all cases with mother with no outstanding actions')
    assert parser.valid?
    assert_equal({ Canql::ALL => false }, parser.meta_data['action.mother.actioninitiated'])
  end

  def test_should_filter_mother_by_an_outstanding_action
    parser = Canql::Parser.new('all cases with mother with an outstanding action')
    assert parser.valid?
    assert_equal({ Canql::ALL => true }, parser.meta_data['action.mother.actioninitiated'])
  end

  def test_should_filter_mother_by_action_hosital_name
    parser = Canql::Parser.new('all cases with mother with search action at addenbrookes hospital')
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.mother.actioninitiated'])
    assert_equal({ Canql::BEGINS => 'ADDENBROOKES', :interval => 44...65 },
                 parser.meta_data['action.mother.providername'])
  end

  def test_should_filter_mothers_by_unprocessed_records
    parser = Canql::Parser.new('all cases with mother with unprocessed records')
    assert parser.valid?
    assert_equal({ Canql::ALL => true }, parser.meta_data['unprocessed_records.mother.sources'])
  end

  def test_should_filter_mothers_by_unprocessed_paediatric_records
    parser = Canql::Parser.new('all cases with mother with unprocessed paediatric records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['PAEDIATRIC'] },
                 parser.meta_data['unprocessed_records.mother.sources'])
  end
end
