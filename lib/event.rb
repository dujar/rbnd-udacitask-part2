class EventItem
   include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
      @description = description || "no description provided".colorize(:red) 
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    if options.count > 2
        raise UdaciListErrors::InvalidNumberOfArguments, "This option is not available yet. Only 'description', 'due' date and 'prioritise' options."
    end

  end
  def details
    format_description + "event dates: " + format_date("event")
  end
end
