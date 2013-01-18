require_relative '../lib/dudas/pair/xml'

FILE = '../examples/00000000.xml'
pair_data = Dudas::PAIR::XML.new ( File.read FILE )

puts pair_data.to_json