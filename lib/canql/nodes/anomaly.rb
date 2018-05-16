# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module Anomaly
      module WithCondition
        def anomaly_type
          natal_period.text_value.strip
        end

        def anomaly_status_type
          status_type.text_value.strip
        end

        def to_anomaly
          anomaly_hash = { 'exists' => existance_filter }
          anomaly_hash['type'] = anomaly_type_filter if anomaly_type.present?
          anomaly_hash['status'] = anomaly_status_type_filter if anomaly_status_type.present?
          anomaly_hash['icd_codes'] = code_filter if code_filter.any?
          anomaly_hash
        end

        def existance_filter
          { Canql::EQUALS => existance_modifier.text_value.strip != 'no' }
        end

        def anomaly_type_filter
          { Canql::EQUALS => anomaly_type }
        end

        def anomaly_status_type_filter
          { Canql::EQUALS => anomaly_status_type }
        end

        def code_filter
          return {} if code_data.text_value.blank?

          code_array = [code_data.first.to_code]
          code_data.rest.elements.each do |code|
            code_array << code.try(:to_code)
          end
          code_array.flatten!
          code_array.delete_if(&:blank?)

          { Canql::BEGINS => code_array }
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
