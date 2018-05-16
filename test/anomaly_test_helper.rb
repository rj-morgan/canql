# frozen_string_literal: true

# Provides test functionaly for test oin anomaly CANQL clauses
module AnomalyTestHelper
  private

  def assert_anomaly_values(parser, index = 0, expected = {})
    assert_dir_block_values(parser, 'anomalies', %w[exists type status icd_codes], index, expected)
  end

  def assert_anomaly_count(parser, numder_of_blocks)
    assert_dir_block_count(parser, 'anomalies', numder_of_blocks)
  end
end
