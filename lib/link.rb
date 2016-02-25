class LinkItem
   include Listable
  attr_reader :description, :site_name
    
  def initialize(url, options={})
      @description = url || "no url provided".colorize(:red)
    @site_name = options[:site_name] || "no site name provided".colorize(:red)
    if options.count > 1
        raise UdaciListErrors::InvalidNumberOfArguments, "This option is not available yet. Only 'description', 'due' date and 'prioritise' options."
    end

  end
  def details
    format_description + "site name: " + format_name
  end
end
