# frozen_string_literal: true
module Canql #:nodoc: all
  module Nodes
    module Anomaly
      module Exists
        def anomaly_type
          text_value = natal_period.text_value.strip
          return '' if '' == text_value

          ".#{text_value}"
        end

        def meta_data_item
          {
            "anomaly#{anomaly_type}.exists" => {
              Canql::EQUALS => existance_modifier.text_value.strip != 'no'
            }
          }
        end
      end
    end
  end
end
