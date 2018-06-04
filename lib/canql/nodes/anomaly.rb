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
          anomaly_hash['icd_codes'] = code_filter[:icd_code] if code_filter[:icd_code].present?
          return anomaly_hash if code_filter[:code_group].blank?
          anomaly_hash['code_groups'] = code_filter[:code_group]
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

        def code_type(code)
          return :icd_code if code.respond_to?(:to_code) && code.to_code.present?
          return :code_group if code.respond_to?(:to_code_group) && code.to_code_group.present?
          raise 'Unable to find code type'
        end

        def code_value(code)
          return code.to_code if :icd_code == code_type(code)
          code.to_code_group
        end

        def prepare_code_filters(code_array)
          code_array[:icd_code].flatten!
          code_array[:icd_code].delete_if(&:blank?)
          code_array[:code_group].flatten!
          code_array[:code_group].delete_if(&:blank?)

          code_filters = {}
          if code_array[:icd_code].any?
            code_filters[:icd_code] = { Canql::BEGINS => code_array[:icd_code] }
          end
          return code_filters if code_array[:code_group].blank?
          code_filters[:code_group] = { Canql::EQUALS => code_array[:code_group] }
          code_filters
        end

        def code_filter
          return {} if code_data.text_value.blank?

          code_arrays = { icd_code: [], code_group: [] }
          code_arrays[code_type(code_data.first)] << code_value(code_data.first)
          code_data.rest.elements.each do |code|
            code_arrays[code_type(code)] << code_value(code)
          end
          prepare_code_filters(code_arrays)
        end
      end

      module AdditionalCodeNode
        def code_type
          return :icd_code if anomalies_icd_code.respond_to?(:to_code)
          :code_group
        end

        def to_code
          anomalies_icd_code.to_code if :icd_code == code_type
        end

        def to_code_group
          anomalies_icd_code.to_code_group if :code_group == code_type
        end
      end

      module SingleIcdCodeNode
        def to_code
          text_value.upcase
        end
      end

      module SingleCodeGroupNode
        def to_code_group
          text_value.upcase
        end
      end
    end
  end
end
