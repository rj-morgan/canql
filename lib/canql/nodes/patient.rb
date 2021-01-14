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

      module PrimacyNode
        def meta_data_item
          { 'patient.primacy' => { Canql::EQUALS => primacy.text_value } }
        end
      end

      module CategoryNode
        def meta_data_item
          { 'patient.category' => { Canql::EQUALS => clean_category } }
        end

        def clean_category
          return 'eurocat_red' if 'eurocat red' == category.text_value
          return 'eurocat_amber' if 'eurocat amber' == category.text_value
          return 'eurocat_green' if 'eurocat green' == category.text_value
          return 'eurocat_amber_green' if 'eurocat amber and green' == category.text_value
          return 'eurocat_red_amber' if 'eurocat red and amber' == category.text_value

          category.text_value
        end
      end

      module FieldExists
        FIELDS = {
          'date of birth': { patient: 'birthdate', mother: 'birthdate' },
          'dob': { patient: 'birthdate', mother: 'birthdate' },
          'date of vital status': { patient: 'dateofvitalstatus', mother: 'dateofvitalstatus' },
          'delivery postcode': { patient: 'delivery_postcode' },
          'booking postcode': { patient: 'booking_postcode' },
          'nhs number': { patient: 'nhsnumber', mother: 'nhsnumber' },
          'birth weight': { patient: 'weight' },
          'place of delivery': { patient: 'placeofdelivery' },
          'sex': { patient: 'sex' },
          'outcome': { patient: 'outcome' },
          'edd': { patient: 'expecteddeliverydate' },
          'expected delivery date': { patient: 'expecteddeliverydate' },
          'booking hospital': { patient: 'booking_hospital' },
          'screening status': { patient: 'screeningstatus' },
          'number of fetuses at delivery': { patient: 'numoffetusesatdelivery' },
          'malformed in set': { patient: 'malformedinset' },
          'gestation at delivery': { patient: 'gestationallength' },
          'booking date': { patient: 'firstbookingdate' }
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
