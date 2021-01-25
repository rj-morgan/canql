# frozen_string_literal: true

# require 'active_support/core_ext/object/blank'

module Canql #:nodoc: all
  module Nodes
    module RecordCountNode
      def meta_data_item
        { 'limit' => { Canql::EQUALS => number.text_value.to_i } }
      end
    end
  end
end

module Canql #:nodoc: all
  module Nodes
    # Returns a filter detailing the require result type (cases or patients)
    module SubjectNode
      def meta_data_item
        type_map = { cases: 'case', babies: 'case', patients: 'patient' }
        raise 'Unknown result type' if type_map[subject.text_value.to_sym].nil?

        { 'results.subject' => { Canql::EQUALS => type_map[subject.text_value.to_sym] } }
      end
    end

    # Provides meta data for with conditions that return
    # multiple instances of a condition type as an array
    module WithConditions
      def meta_data_item
        conditions = {}
        sub_clauses = build_sub_clauses

        %i[
          anomalies genetic_tests test_results test_result_groups test_acceptances
        ].each do |condition_key|
          if sub_clauses[condition_key].present?
            conditions[condition_key.to_s] = { Canql::ALL => sub_clauses[condition_key] }
          end
        end
        conditions
      end

      def build_sub_clauses
        sub_clauses = {}

        post.elements.each do |element|
          add_sub_clause(sub_clauses, element, :anomalies, :to_anomaly)
          add_sub_clause(sub_clauses, element, :genetic_tests, :to_genetic_test)
          add_sub_clause(sub_clauses, element, :test_results, :to_test_result)
          add_sub_clause(
            sub_clauses, element, :test_result_groups, :to_test_result_group
          )
          add_sub_clause(sub_clauses, element, :test_acceptances, :to_test_acceptance)
        end
        sub_clauses
      end

      def add_sub_clause(sub_clauses, element, key, condition)
        return sub_clauses unless element.respond_to?(condition)

        sub_clauses[key] ||= []
        sub_clauses[key] << element.send(condition)
      end
    end
  end
end
