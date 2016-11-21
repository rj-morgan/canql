# frozen_string_literal: true
module Canql #:nodoc: all
  module Nodes
    module TestResult
      module Exists
        def test_result_type
          text_value = natal_period.text_value.strip
          return '' if '' == text_value

          ".#{text_value}"
        end

        def meta_data_item
          { "testresults#{test_result_type}.exists" => {
            Canql::EQUALS => existance_modifier.text_value.strip != 'no'
          } }
        end
      end
    end
  end
end
