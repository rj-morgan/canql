# frozen_string_literal: true
module Treetop
  module Runtime
    # We extend the SyntaxNode class to include a hash of meta data.
    # Individual rules can define meta_data_item method that must return
    # a hash that is merged with the hash data for the entire query.
    class SyntaxNode
      def meta_data(hash = {})
        hash.merge!(meta_data_item) if respond_to?(:meta_data_item)

        if nonterminal?
          elements.each do |element|
            element.meta_data(hash)
          end
        end

        hash
      end

      def text_values_for_marker(marker)
        list = []
        text_values_for_marker_scanner(self, marker, list)
        list
      end

      def reverse_scan_for_marker(marker)
        marker_value = reverse_marker_scanner(self, marker)
        return if marker_value.nil? || marker_value.empty?
        marker_value
      end

      private

      def text_values_for_marker_scanner(root, marker, list)
        return if root.elements.nil?
        root.elements.each do |e|
          list << e.send(marker).text_value if e.respond_to?(marker)
          text_values_for_marker_scanner(e, marker, list)
        end
        list
      end

      def reverse_marker_scanner(root, marker)
        return if root.nil? || root.elements.nil?
        marker_value = root.send(marker).text_value if root.respond_to?(marker)
        if marker_value.nil? || marker_value.empty?
          marker_value = reverse_marker_scanner(root.parent, marker)
        end
        marker_value
      end
    end
  end
end
