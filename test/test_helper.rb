# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __dir__)
require 'canql'

require 'minitest/autorun'
require 'minitest/unit'

# Override the default Date#to_s format to ensure the formmating is right
Date::DATE_FORMATS[:default] = '%d.%m.%Y'

# This method helps make the assertion that a query producing more than one meta_data filter
# contains all the meta_data filters of the equivalent array of of individual queries.
# i.e. the query:
#
#   'all tumours diagnosed in january 2011 with unprocessed records'
#
# contains all the meta_data filters of the following queries:
#
#   'all tumours diagnosed in january 2011'
#   'all tumours with unprocessed records'
#
def assert_meta_data_includes(combined_query, individual_queries)
  combined_meta_data = combined_query.meta_data
  individual_queries.each do |individual_query|
    individual_meta_data = Canql::Parser.new(individual_query).meta_data
    individual_meta_data.each do |name, filter|
      assert_equal combined_meta_data[name], filter,
                   "combined meta data does not include #{filter.inspect}"
    end
  end
end

def assert_array_includes(array, subset)
  assert((subset - array).empty?)
end

def assert_dir_block_count(parser, block_type, numder_of_blocks)
  return true if parser.meta_data[block_type].blank? && numder_of_anomalies.zero?

  assert parser.meta_data[block_type].present?, 'No DIR blocks to count'
  assert_equal numder_of_blocks, parser.meta_data.dig(block_type, Canql::ALL).count
end

def assert_dir_block_values(parser, block_type, all_keys = nil, index = 0, expected = {})
  dir_blocks = parser.meta_data.dig(block_type, Canql::ALL)
  assert dir_blocks.present?, 'There are no DIR blocks to check'
  assert index < dir_blocks.count, "The requested DIR block #{index} does not exist"

  dir_block = dir_blocks[index]
  assert_dir_block_keys_valid dir_block, all_keys
  assert_dir_block_has_expected_keys dir_block, expected
  dir_block.each_key do |key|
    assert_nil dir_block[key] if expected.keys.exclude?(key)
    assert_equal expected[key], dir_block[key] if expected.keys.include?(key)
  end
  true
end

def assert_dir_block_keys_valid(dir_block, all_keys = nil)
  assert dir_block.keys.reject { |key| all_keys.include?(key) }.none?,
         "DIR block has unknown keys #{dir_block.keys.reject { |key| all_keys.include?(key) }}"
end

def assert_dir_block_has_expected_keys(dir_block, expected = {})
  missing_keys = expected.keys.reject { |key| dir_block.include?(key) }
  assert missing_keys.none?, "Expected key not present in DIR block: #{missing_keys}"
end

def base_meta_data(result_type = :case)
  { 'results.subject' => { Canql::EQUALS => result_type.to_s } }
end
