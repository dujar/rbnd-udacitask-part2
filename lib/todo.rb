class TodoItem
   include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
      @description = description || "no description provided".colorize(:red)
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
        @priority = options[:priority] 
    if @priority == "high" ||  @priority == "medium" || @priority == "low" || @priority == nil
        @priority = options[:priority] 
    else
        raise UdaciListErrors::InvalidPriorityValue, "The #{@priority} priority level is not available unfortunately. Choose between high, medium or low. "
    end

    if options.count > 2
        raise UdaciListErrors::InvalidNumberOfArguments, "This option is not available yet. Only 'description', 'due' date and 'prioritise' options."
    end
  end

  def details
    format_description + "due: " +
    format_date("todo") +
    format_priority
  end
end
