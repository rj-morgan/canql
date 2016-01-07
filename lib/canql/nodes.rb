# These file contain custom mixins for treetop
# nodes that enable them to generate meta_data_items, etc.

# Treetop documentation seems to be out of date;
# it says to create subclasses of nodes. However,
# treetop 1.4.10 expects to extend the node with
# the specified <MODULE> from the grammar.
require 'canql/treetop/extensions'
require 'canql/constants'

require 'canql/nodes/anomaly'
require 'canql/nodes/test_result'
require 'canql/nodes/patient'
require 'canql/nodes/main'
require 'canql/nodes/registry'
