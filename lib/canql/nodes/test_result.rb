# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module TestResult
      module WithCondition
        def existance_condition
          @existance_condition ||= {
            'no' => { Canql::EQUALS => false },
            'some' => { Canql::EQUALS => true },
            '' => { Canql::EQUALS => true },
            'unassigned' => { Canql::ASSIGNED => false },
            'unconfirmed' => { Canql::ASSIGNED => false }
          }
        end

        def test_result_type
          natal_period.text_value.strip
        end

        def to_test_result
          test_result_hash = { 'exists' => existance_filter }
          test_result_hash['type'] = test_result_type_filter if test_result_type.present?
          test_result_hash
        end

        def existance_filter
          existance_condition[existance_modifier.text_value.strip]
        end

        def test_result_type_filter
          { Canql::EQUALS => test_result_type }
        end
      end
    end
  end
end
