module Canql #:nodoc: all
  module Nodes
    module RegistryNode
      def meta_data_item
        { 'patient.registry' => { Canql::EQUALS => registry.to_registrycode } }
      end
    end

    module RegistryCodeNode
      def to_registrycode
        text_value.upcase
      end
    end
  end
end
