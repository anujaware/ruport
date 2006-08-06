module Ruport::Data
  class Collection
    require "forwardable"
    extend Forwardable
    include Enumerable
    include Taggable

    def initialize(data=nil,options={})
      @data = data.dup if data
    end

    def as(type)
      Ruport::Format.table :data => self, :plugin => type
    end

    def to_set
      Set.new :data => data
    end
    
    def to_table(options={})
      Table.new({:data => data.map { |r| r.to_a }}.merge(options))
    end

    attr_reader :data
    def_delegators :@data, :each, :length, :[], :empty?
  end
end

