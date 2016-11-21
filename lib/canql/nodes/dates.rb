# frozen_string_literal: true
require 'chronic'
require 'ndr_support/daterange'

module Canql #:nodoc: all
  module Nodes
    module FuzzyDateNode
      delegate :to_daterange, to: :date
    end

    module SpecificDateNode
      delegate :to_daterange, to: :date_fragment
    end

    module FragmentedDateRangeNode
      def to_daterange
        d1 = start.to_daterange.date1
        d2 = finish.to_daterange.date2

        Daterange.new(d1, d2)
      end
    end

    module DateFragmentNode
      delegate :to_daterange, to: :fragment
    end

    module DateRangeNode
      def to_daterange
        Daterange.new(text_value.to_s)
      end
    end

    module ChronicDateNode
      def to_daterange
        chronic = Chronic.parse(text_value.to_s, context: :past, guess: false)
        if chronic.instance_of?(Chronic::Span)
          Daterange.new(chronic.begin, chronic.end - 1.day)
        else
          Daterange.new(chronic)
        end
      end
    end
  end
end
