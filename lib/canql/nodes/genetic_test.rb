# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module GeneticTest
      module WithCondition
        def to_genetic_test
          genetic_test_hash = { 'exists' => existance_filter }
          genetic_test_hash
        end

        def existance_filter
          { Canql::EQUALS => existance_modifier.text_value.strip != 'no' }
        end
      end
    end
  end
end
