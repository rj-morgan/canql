# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module BatchTypeNode
      def to_type
        string = respond_to?(:normalise) ? normalise : text_value
        string.upcase
      end
    end

    module PaediatricNode
      def normalise
        'paediatric'
      end
    end

    module Enote2Node
      def normalise
        'enote2'
      end
    end

    module BadgerNode
      def normalise
        'badger'
      end
    end

    module UcytoNode
      def normalise
        'ucyto'
      end
    end
  end
end
