# frozen_string_literal: true

require 'test_helper'

# registration action and unprocessed record tests
class EBaseRecordsTest < Minitest::Test
  def test_should_filter_by_qa_action
    parser = Canql::Parser.new('all cases with qa action')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'QA' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_qa_action_on_patients
    parser = Canql::Parser.new('all patients with qa action')
    assert parser.valid?
    assert_equal({ Canql::EQUALS => 'QA' }, parser.meta_data['action.actioninitiated'])
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
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
    assert_equal({ Canql::EQUALS => 'case' }, parser.meta_data['results.subject'])
  end

  def test_should_filter_by_unprocessed_records_on_patients
    parser = Canql::Parser.new('all patients with unprocessed records')
    assert parser.valid?
    assert_equal({ Canql::ALL => true }, parser.meta_data['unprocessed_records.sources'])
    assert_equal({ Canql::EQUALS => 'patient' }, parser.meta_data['results.subject'])
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

  def test_should_filter_on_ebr_specific_processing_date
    parser = Canql::Parser.new('all cases with unprocessed records dated on 20/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => %w[2015-06-20 2015-06-20] },
                 parser.meta_data['unprocessed_records.processing_date'])

    parser = Canql::Parser.new('all cases with unprocessed records dated for processing on 20/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => %w[2015-06-20 2015-06-20] },
                 parser.meta_data['unprocessed_records.processing_date'])
  end

  def test_should_filter_on_ebr_processing_date_range
    parser = Canql::Parser.new('all cases with unprocessed records dated between 20/06/2015 and 25/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => %w[2015-06-20 2015-06-25] },
                 parser.meta_data['unprocessed_records.processing_date'])

    parser = Canql::Parser.new('all cases with unprocessed records dated for processing between 20/06/2015 and 25/06/2015')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => %w[2015-06-20 2015-06-25] },
                 parser.meta_data['unprocessed_records.processing_date'])
  end

  def test_should_filter_on_ebr_processing_date_word_range
    parser = Canql::Parser.new('all cases with unprocessed records dated between today and tomorrow')
    assert parser.valid?
    today = Date.today
    tomorrow = today + 1
    assert_equal(
      { Canql::LIMITS => [today.strftime('%Y-%m-%d'), tomorrow.strftime('%Y-%m-%d')] },
      parser.meta_data['unprocessed_records.processing_date']
    )

    parser = Canql::Parser.new('all cases with unprocessed records dated for processing between today and tomorrow')
    assert parser.valid?
    today = Date.today
    tomorrow = today + 1
    assert_equal(
      { Canql::LIMITS => [today.strftime('%Y-%m-%d'), tomorrow.strftime('%Y-%m-%d')] },
      parser.meta_data['unprocessed_records.processing_date']
    )
  end

  def test_should_filter_on_ebr_processing_registry
    parser = Canql::Parser.new('all cases with unprocessed east records')
    assert parser.valid?
    assert_equal(
      { Canql::EQUALS => 'east' }, parser.meta_data['unprocessed_records.processing_registry']
    )
  end

  def test_should_filter_on_mother_ebr_processing_registry
    parser = Canql::Parser.new('all cases with mother with unprocessed east records')
    assert parser.valid?
    assert_equal(
      { Canql::EQUALS => 'east' }, parser.meta_data['unprocessed_records.mother.processing_registry']
    )
  end
end
