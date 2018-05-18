# frozen_string_literal: true

module Canql #:nodoc: all
  module Nodes
    module Patient
      module GenderNode
        def meta_data_item
          { 'patient.sex' => { Canql::EQUALS => gender.text_value == 'male' ? '1' : '2' } }
        end
      end

      module OutcomeNode
        def meta_data_item
          { 'patient.outcome' => { Canql::EQUALS => outcome.text_value } }
        end
      end

      module FieldExists
        FIELDS = {
          'date of birth':        { patient: 'birthdate', mother: 'birthdate' },
          'dob':                  { patient: 'birthdate', mother: 'birthdate' },
          'postcode':             { patient: 'postcode',  mother: 'postcode'  },
          'nhs number':           { patient: 'nhsnumber', mother: 'nhsnumber' },
          'birth weight':         { patient: 'weight' },
          'place of delivery':    { patient: 'placeofdelivery' },
          'sex':                  { patient: 'sex' },
          'outcome':              { patient: 'outcome' }
        }.freeze

        def meta_data_item
          subject = reverse_scan_for_marker(:subject) == 'mother' ? 'mother' : 'patient'
          field_names = actual_field_names(
            patient_field_list.text_values_for_marker(:patient_field_name), subject.to_sym
          )
          modifer = field_existance_modifier.text_value.strip
          existance = modifer != 'missing' ? 'fields_populated' : 'fields_missing'
          { "#{subject}.#{existance}" => { Canql::EQUALS => field_names } }
        end

        def actual_field_names(fields, subject)
          actual_fields = []
          fields.each do |f|
            f = f.downcase.to_sym
            actual_fields << FIELDS[f][subject] unless FIELDS[f].nil? || FIELDS[f][subject].nil?
          end
          actual_fields
        end
      end

      module ExpectedDateRangeNode
        def meta_data_item
          range = fuzzy_date.to_daterange
          {
            'patient.expecteddeliverydate' => {
              Canql::LIMITS => [
                range.date1.try(:to_date).try(:iso8601),
                range.date2.try(:to_date).try(:iso8601)
              ]
            }
          }
        end
      end
    end
  end
end
