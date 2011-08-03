require 'graph'

module Gritty
  module AutoNode
    def autonode label
      @node_num = (@node_num || 0) + 1
      name = "node#{@node_num}"
      node name, label
      name
    end
  end

  class NodeBuilder
    def initialize(graph)
      @graph = graph
    end

    def build(obj, parent)
      case obj
      when Hash then
        obj.each do |k, v|
          node = @graph.autonode k.inspect
          @graph.edge parent, node
          build v, node
        end
      when Array then
        obj.each do |o|
          build o, parent
        end
      when Struct then
        container = @graph.autonode obj.class.to_s
        @graph.edge parent, container

        obj.members.each do |k|
          v = obj.send k
          node = @graph.autonode k.inspect
          @graph.edge container, node
          build v, node
        end
      else
        node = obj.inspect
        @graph.edge parent, node
      end
    end
  end
end

class Graph
  include Gritty::AutoNode
end
