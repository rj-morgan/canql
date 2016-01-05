require 'canql/nodes'
require 'canql/grammars'

module Canql
  # This class simplifies CANQL queries by wrapping them in a little syntactic sugar.
  class Parser
    attr_reader :parser

    def initialize(query)
      @parser = CanqlParser.new
      @result = @parser.parse(query.downcase)

      return if valid?
      # FIXME: should log "Parser failed parsing \"#{query}\": #{@parser.failure_reason} " \
      #                   "(line: #{@parser.failure_line}, column: #{@parser.failure_column})"
    end

    def valid?
      !@result.nil?
    end

    def failure_reason
      valid? ? nil : @parser.failure_reason
    end

    def failure_line
      valid? ? nil : @parser.failure_line
    end

    def failure_column
      valid? ? nil : @parser.failure_column
    end

    def meta_data
      valid? ? @result.meta_data : {}
    end
  end
end
