module RubyShellProxy::Helpers::Quotable
  # return quoted string
  def quote_and_escape(text, quote = '"')
    "#{quote}#{text.gsub(/#{quote}/) { |m| "#{quote}\\#{quote}#{quote}" }}#{quote}"
  end

  # quote the command elements that are not part of NOT_QUOTABLE array
  def quote_command(*elements, quote_with: '"')
    elements = elements.flatten
    elements.map do |element|
      (NOT_QUOTABLE||[]).include?(element) ? element : quote_and_escape(element, quote_with)
    end
    elements.join(" ")
  end
end
