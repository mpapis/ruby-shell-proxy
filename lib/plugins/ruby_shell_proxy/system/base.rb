class RubyShellProxy::System::Base
  RubyShellProxy.plugins.matching!(
    'helpers', %w{quotable}
  ){|plugin| extend plugin }

  NOT_QUOTABLE = %w( | < > [ ] )

  # remove the given path
  def remove(path, force: false, recursive: false, quote_with: '"')
    command = [ "rm" ]
    command << "-f" if force
    command << "-r" if recursive
    command << path
    quote_command(command, quote_with: quote_with)
  end

  def path_exist?(path, file: false, directory: false, quote_with: '"')
    command = [ "[" ]
    if file && directory
      raise ArgumentError.new("Can not specify together 'file' and 'directory' checks!")
    elsif file
      command << "-f"
    elsif directory
      command << "-d"
    else
      command << "-e"
    end
    command << path
    command << "]"
    quote_command(command, quote_with: quote_with)
  end

end
