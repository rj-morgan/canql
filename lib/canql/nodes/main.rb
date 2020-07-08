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
        anomalies = []
        genetic_tests = []
        test_results = []
        test_result_groups = []

        post.elements.each do |element|
          anomalies << element.to_anomaly if element.respond_to?(:to_anomaly)
          genetic_tests << element.to_genetic_test if element.respond_to?(:to_genetic_test)
          test_results << element.to_test_result if element.respond_to?(:to_test_result)
          if element.respond_to?(:to_test_result_group)
            test_result_groups << element.to_test_result_group
          end
        end

        conditions['anomalies'] = { Canql::ALL => anomalies } if anomalies.any?
        conditions['genetic_tests'] = { Canql::ALL => genetic_tests } if genetic_tests.any?
        conditions['test_results'] = { Canql::ALL => test_results } if test_results.any?
        if test_result_groups.any?
          conditions['test_result_groups'] = { Canql::ALL => test_result_groups }
        end
        conditions
      end
    end
  end
end
