# frozen_string_literal: true

require 'treetop'

Treetop.load File.expand_path('grammars/age', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/dates', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/anomaly', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/batch_types', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/e_base_records', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/genetic_test', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/test_result', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/test_result_group', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/patient', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/registry', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/provider', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/perinatal_hospital', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/main', File.dirname(__FILE__))
