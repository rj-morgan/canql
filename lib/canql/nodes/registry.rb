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

    module RegistryAbbrNode
      REGISTRY_ABBR = {
        'thames'     => '68',
        'east mids'  => '72',
        'north east' => '73',
        'south west' => '84',
        'wessex'     => '70',
        'west mids'  => '99',
        'limbo'      => '01',
        'england'    => '00'
      }.freeze unless defined?(REGISTRY_ABBR)

      def to_registrycode
        REGISTRY_ABBR[text_value]
      end
    end
  end
end
