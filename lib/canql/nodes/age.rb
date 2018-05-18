# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module Age
      module BirthDateNode
        def meta_data_item
          subject = reverse_scan_for_marker(:subject) == 'mother' ? 'mother' : 'patient'
          range = fuzzy_date.to_daterange
          {
            "#{subject}.birthdate" => {
              Canql::LIMITS => [
                range.date1.try(:to_date).try(:iso8601), range.date2.try(:to_date).try(:iso8601)
              ]
            }
          }
        end
      end

      module DeathDateNode
        def meta_data_item
          subject = reverse_scan_for_marker(:subject) == 'mother' ? 'mother' : 'patient'
          range = fuzzy_date.to_daterange
          {
            "#{subject}.deathdate" => {
              Canql::LIMITS => [
                range.date1.try(:to_date).try(:iso8601), range.date2.try(:to_date).try(:iso8601)
              ]
            }
          }
        end
      end
    end
  end
end
