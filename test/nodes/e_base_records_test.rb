# frozen_string_literal: true

require 'test_helper'

# registration action and unprocessed record tests
class EBaseRecordsTest < Minitest::Test
  def test_should_filter_by_qa_action
    parser = Canql::Parser.new('all cases with qa action')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'QA' }, parser.meta_data['action.actioninitiated'])
  end

  def test_should_filter_by_scr_check_action
    parser = Canql::Parser.new('all cases with scr_check action')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SCR_CHECK' }, parser.meta_data['action.actioninitiated'])
  end

  def test_should_filter_by_scr_checked_action
    parser = Canql::Parser.new('all cases with scr_checked action')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SCR_CHECKED' }, parser.meta_data['action.actioninitiated'])
  end

  def test_should_filter_by_action_hosital_code
    parser = Canql::Parser.new('all cases with search action at hospital RGT01')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::EQUALS => 'RGT01' }, parser.meta_data['action.providercode'])
  end

  def test_should_filter_by_action_trust_code
    parser = Canql::Parser.new('all cases with search action at trust RGT')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::BEGINS => 'RGT' }, parser.meta_data['action.providercode'])
  end

  def test_should_filter_by_no_outstanding_actions
    parser = Canql::Parser.new('all cases with no outstanding actions')
    assert parser.valid?
    assert_equal({ Canql::ALL => false }, parser.meta_data['action.actioninitiated'])
  end

  def test_should_filter_by_an_outstanding_action
    parser = Canql::Parser.new('all cases with an outstanding action')
    assert parser.valid?
    assert_equal({ Canql::ALL => true }, parser.meta_data['action.actioninitiated'])
  end

  def test_should_filter_by_action_hosital_name
    parser = Canql::Parser.new('all cases with search action at addenbrookes hospital')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::BEGINS => 'ADDENBROOKES', :interval => 32...53 },
                 parser.meta_data['action.providername'])
  end

  def test_should_filter_by_action_trust_name
    parser = Canql::Parser.new('all cases with search action at addenbrookes trust')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'SEARCH' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::BEGINS => 'ADDENBROOKES', :interval => 32...50 },
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

  def test_should_filter_by_unprocessed_enote2_records
    parser = Canql::Parser.new('all cases with unprocessed enote records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['ENOTE2'] },
                 parser.meta_data['unprocessed_records.sources'])

    parser = Canql::Parser.new('all cases with unprocessed electronic notification records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['ENOTE2'] },
                 parser.meta_data['unprocessed_records.sources'])
  end

  def test_should_filter_by_unprocessed_badger_records
    parser = Canql::Parser.new('all cases with unprocessed badger records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['BADGER'] },
                 parser.meta_data['unprocessed_records.sources'])
  end

  def test_should_filter_by_unprocessed_ucyto_records
    parser = Canql::Parser.new('all cases with unprocessed ucyto records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UCYTO'] },
                 parser.meta_data['unprocessed_records.sources'])

    parser = Canql::Parser.new('all cases with unprocessed cyto records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UCYTO'] },
                 parser.meta_data['unprocessed_records.sources'])

    parser = Canql::Parser.new('all cases with unprocessed cytogenetic records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UCYTO'] },
                 parser.meta_data['unprocessed_records.sources'])
  end

  def test_should_filter_by_unprocessed_nipt_records
    parser = Canql::Parser.new('all cases with unprocessed nipt records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['NIPT'] },
                 parser.meta_data['unprocessed_records.sources'])
  end

  def test_should_filter_by_unprocessed_rddeath_records
    parser = Canql::Parser.new('all cases with unprocessed rddeath records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['RD_DEATH'] },
                 parser.meta_data['unprocessed_records.sources'])

    parser = Canql::Parser.new('all cases with unprocessed rare disease death records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['RD_DEATH'] },
                 parser.meta_data['unprocessed_records.sources'])
  end

  def test_should_filter_by_unprocessed_umum_records
    parser = Canql::Parser.new('all cases with unprocessed umum records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UMUM'] },
                 parser.meta_data['unprocessed_records.sources'])

    parser = Canql::Parser.new('all cases with unprocessed mum records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UMUM'] },
                 parser.meta_data['unprocessed_records.sources'])
  end
end
