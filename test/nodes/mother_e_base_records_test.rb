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

  def test_should_filter_mothers_by_unprocessed_enote2_records
    parser = Canql::Parser.new('all cases with mother with unprocessed enote records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['ENOTE2'] },
                 parser.meta_data['unprocessed_records.mother.sources'])

    parser = Canql::Parser.new('all cases with mother with unprocessed electronic notification records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['ENOTE2'] },
                 parser.meta_data['unprocessed_records.mother.sources'])
  end

  def test_should_filter_mothers_by_unprocessed_badger_records
    parser = Canql::Parser.new('all cases with mother with unprocessed badger records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['BADGER'] },
                 parser.meta_data['unprocessed_records.mother.sources'])
  end

  def test_should_filter_mothers_by_unprocessed_ucyto_records
    parser = Canql::Parser.new('all cases with mother with unprocessed ucyto records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UCYTO'] },
                 parser.meta_data['unprocessed_records.mother.sources'])

    parser = Canql::Parser.new('all cases with mother with unprocessed cyto records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UCYTO'] },
                 parser.meta_data['unprocessed_records.mother.sources'])

    parser = Canql::Parser.new('all cases with mother with unprocessed cytogenetic records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UCYTO'] },
                 parser.meta_data['unprocessed_records.mother.sources'])
  end

  def test_should_filter_mothers_by_unprocessed_nipt_records
    parser = Canql::Parser.new('all cases with mother with unprocessed nipt records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['NIPT'] },
                 parser.meta_data['unprocessed_records.mother.sources'])
  end

  def test_should_filter_mothers_by_unprocessed_rddeath_records
    parser = Canql::Parser.new('all cases with mother with unprocessed rddeath records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['RD_DEATH'] },
                 parser.meta_data['unprocessed_records.mother.sources'])

    parser = Canql::Parser.new('all cases with mother with unprocessed rare disease death records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['RD_DEATH'] },
                 parser.meta_data['unprocessed_records.mother.sources'])
  end

  def test_should_filter_mothers_by_unprocessed_umum_records
    parser = Canql::Parser.new('all cases with mother with unprocessed umum records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UMUM'] },
                 parser.meta_data['unprocessed_records.mother.sources'])

    parser = Canql::Parser.new('all cases with mother with unprocessed mum records')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => ['UMUM'] },
                 parser.meta_data['unprocessed_records.mother.sources'])
  end
end
