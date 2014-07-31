# Add "trim" filter to remove whitespace
module TrimFilter
  def trim(input)
    input.strip
  end

  Liquid::Template.register_filter self
end