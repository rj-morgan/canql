# frozen_string_literal: true

require 'test_helper'

# case anomaly tests
class AgeTest < Minitest::Test
  def test_should_filter_by_case_birth_date_range
    parser = Canql::Parser.new('all cases born between 10/01/2000 and 10/10/2010')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2010-10-10'] },
                 parser.meta_data['patient.birthdate'])
  end

  def test_should_filter_by_case_exect_birth_date
    parser = Canql::Parser.new('all cases born on 10/01/2000')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2000-01-10'] },
                 parser.meta_data['patient.birthdate'])
  end

  def test_should_filter_by_mothers_birth_date_range
    parser = Canql::Parser.new('all cases with mother born between 10/01/2000 and 10/10/2010')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2010-10-10'] },
                 parser.meta_data['mother.birthdate'])
  end

  def test_should_filter_by_mothers_exect_birth_date
    parser = Canql::Parser.new('all cases with mother born on 10/01/2000')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2000-01-10'] },
                 parser.meta_data['mother.birthdate'])
  end

  def test_should_filter_by_case_death_date_range
    parser = Canql::Parser.new('all cases who died between 10/01/2000 and 10/10/2010')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2010-10-10'] },
                 parser.meta_data['patient.deathdate'])
  end

  def test_should_filter_by_case_exect_death_date
    parser = Canql::Parser.new('all cases that died on 10/01/2000')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2000-01-10'] },
                 parser.meta_data['patient.deathdate'])
  end

  def test_should_filter_by_mothers_death_date_range
    parser = Canql::Parser.new('all cases with mother that died between 10/01/2000 and 10/10/2010')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2010-10-10'] },
                 parser.meta_data['mother.deathdate'])
  end

  def test_should_filter_by_mothers_exect_death_date
    parser = Canql::Parser.new('all cases with mother who died on 10/01/2000')
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2000-01-10'] },
                 parser.meta_data['mother.deathdate'])
  end

  def test_should_filter_by_case_combined_birth_and_death_date
    parser = Canql::Parser.new(
      'all cases born between 10/01/2000 and 10/10/2010 and that died on 01/01/2015'
    )
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2010-10-10'] },
                 parser.meta_data['patient.birthdate'])
    assert_equal({ Canql::LIMITS => ['2015-01-01', '2015-01-01'] },
                 parser.meta_data['patient.deathdate'])
  end

  def test_should_filter_by_mother_combined_birth_and_death_date
    parser = Canql::Parser.new(
      'all cases with mother born between 10/01/2000 and 10/10/2010 and that died on 01/01/2015'
    )
    assert parser.valid?
    assert_equal({ Canql::LIMITS => ['2000-01-10', '2010-10-10'] },
                 parser.meta_data['mother.birthdate'])
    assert_equal({ Canql::LIMITS => ['2015-01-01', '2015-01-01'] },
                 parser.meta_data['mother.deathdate'])
  end

  def test_should_filter_by_case_birth_date_quarter
    parser = Canql::Parser.new('all cases born in Q1 2015')
    assert parser.valid?, parser.failure_reason
    assert_nil parser.failure_reason
    assert_equal({ Canql::LIMITS => ['2015-04-01', '2015-06-30'] },
                 parser.meta_data['patient.birthdate'])
  end
end
