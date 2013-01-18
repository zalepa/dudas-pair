class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

lines = File.readlines('tags.txt')
lines.each do |line|
	line = line.gsub(/\s*$/, '')
	puts "'#{line}' => '#{line.underscore}',"
end