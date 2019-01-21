# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module PerinatalProviderCodeNode
      def meta_data_item
        hospital_event = reverse_scan_for_marker(:hospital_event)
        key = 'providercode'
        condition = provider_type.text_value == 'trust' ? Canql::BEGINS : Canql::EQUALS
        { "#{hospital_event}.#{key}" => { condition => code.text_value.upcase } }
      end
    end

    module PerinatalProviderNameNode
      def meta_data_item
        hospital_event = reverse_scan_for_marker(:hospital_event)
        key = 'providername'
        {
          "#{hospital_event}.#{key}" => {
            Canql::BEGINS => short_desc.text_value.upcase,
            :interval => interval
          }
        }
      end
    end
  end
end
