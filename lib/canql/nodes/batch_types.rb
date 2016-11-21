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
  end
end
