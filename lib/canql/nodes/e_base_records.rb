# frozen_string_literal: true
module Canql #:nodoc: all
  module Nodes
    module EBaseRecordsNode
      def meta_data_item
        filter =
          if types.empty?
            { Canql::ALL => true }
          else
            { Canql::EQUALS => types.to_list }
          end
        { 'unprocessed_records.sources' => filter }
      end
    end

    module BatchTypesNode
      delegate :to_list, to: :allowed_types
    end

    module AllowedTypesNode
      def to_list
        list = [batch_type.to_type]
        list.concat types.elements.map(&:extract_type)
      end
    end

    module MoreTypesNode
      def extract_type
        batch_type.to_type
      end
    end

    module ActionsNode
      def meta_data_item
        { 'action.actioninitiated' => { Canql::EQUALS => action_type.text_value.upcase.strip } }
      end
    end

    module ActionProviderCodeNode
      def meta_data_item
        # default to provider
        key = 'providercode'
        { "action.#{key}" => { Canql::EQUALS => code.text_value.upcase } }
      end
    end

    module ActionProviderNameNode
      def meta_data_item
        # default to provider
        key = provider_type.text_value == 'cancer network' ? 'cn_ukacrname' : 'providername'
        {
          "action.#{key}" => {
            Canql::BEGINS => short_desc.text_value.upcase,
            :interval => interval
          }
        }
      end
    end
  end
end
