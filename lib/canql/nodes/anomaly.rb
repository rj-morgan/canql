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

        def anomaly_status_type
          text_value = status_type.text_value.strip
          return '' if '' == text_value

          ".#{text_value}"
        end

        def anomaly_qualifier
          anomaly_status_type + anomaly_type
        end

        def meta_data_item
          existance_filter.merge(code_filter)
        end

        def existance_filter
          {
            "anomaly#{anomaly_qualifier}.exists" => {
              Canql::EQUALS => existance_modifier.text_value.strip != 'no'
            }
          }
        end

        def code_filter
          return {} if code_data.text_value.blank?
          code_array = [code_data.first.to_code]
          code_data.rest.elements.each do |code|
            code_array << code.try(:to_code)
          end
          code_array.flatten.delete_if(&:blank?)

          { "anomaly#{anomaly_qualifier}.icd_code" => { Canql::BEGINS => code_array } }
        end
      end

      module AdditionalIcdCodeNode
        def to_code
          anomalies_icd_code.to_code
        end
      end

      module SingleIcdCodeNode
        def to_code
          text_value.upcase
        end
      end
    end
  end
end
