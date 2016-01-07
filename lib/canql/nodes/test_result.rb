module Canql #:nodoc: all
  module Nodes
    module TestResult
      module NatalPeriod
        def meta_data_item
          { 'testresults.natal_period' => { Canql::EQUALS => text_value.strip } }
        end
      end

      module Exists
        def meta_data_item
          { 'testresults.exists' => {
            Canql::EQUALS => existance_modifier.text_value.strip != 'no'
          } }
        end
      end
    end
  end
end
