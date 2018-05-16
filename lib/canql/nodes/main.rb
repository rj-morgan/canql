# frozen_string_literal: true

# require 'active_support/core_ext/object/blank'

module Canql #:nodoc: all
  module Nodes
    module RecordCountNode
      def meta_data_item
        { 'limit' => { Canql::EQUALS => number.text_value.to_i } }
      end
    end
  end
end

module Canql #:nodoc: all
  module Nodes
    # Provides meta data for with conditions that return
    # multiple instances of a condition type as an array
    module WithConditions
      def meta_data_item
        conditions = {}
        anomalies = []

        post.elements.each do |element|
          anomalies << element.to_anomaly if element.respond_to?(:to_anomaly)
        end

        conditions['anomalies'] = { Canql::ALL => anomalies } if anomalies.any?
        conditions
      end
    end
  end
end
