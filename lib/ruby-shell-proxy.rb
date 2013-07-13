require 'pluginator'

module RubyShellProxy
  module Helpers; end
  module System; end
  def self.plugins
    @plugins ||= Pluginator.find("ruby_shell_proxy", extends: %i{ matching } )
  end
end
