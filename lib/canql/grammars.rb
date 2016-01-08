require 'treetop'

Treetop.load File.expand_path('grammars/anomaly', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/test_result', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/patient', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/registry', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/main', File.dirname(__FILE__))
