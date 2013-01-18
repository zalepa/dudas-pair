require_relative '../lib/dudas'
require 'pp'

FILE = '../examples/00000000.xml'
pair_data = Dudas::PAIR::XML.new ( File.read FILE )

pp pair_data.hash