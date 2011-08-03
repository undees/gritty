$: << File.expand_path(File.basename(__FILE__) + '/../lib')

require 'minitest/autorun'
require 'minitest/spec'
require 'gritty'

include Gritty

describe NodeBuilder do
  it 'builds a simple graph' do
    g = digraph do
      input = [{:foo => {:bar => "baz"}},
               {:bar => {:baz => "quux"}}]
      builder = NodeBuilder.new self
      builder.build input, 'root'
    end

    expected = <<HERE.strip
digraph 
  {
    "node1"              [ label = ":foo"       ];
    "node2"              [ label = ":bar"       ];
    "node3"              [ label = ":bar"       ];
    "node4"              [ label = ":baz"       ];
    "root" -> "node1";
    "root" -> "node3";
    "node1" -> "node2";
    "node2" -> "\\"baz\\"";
    "node3" -> "node4";
    "node4" -> "\\"quux\\"";
  }
HERE

    g.to_s.must_equal expected
  end
end
