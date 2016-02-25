module Listable
  # Listable methods go here
  def format_description
    "#{@description}".ljust(25)
  end

  def format_date event
      if event =="todo"
        @due ? @due.strftime("%D") : "No due date"
      elsif event == "event"
        dates = @start_date.strftime("%D") if @start_date
        dates << " -- " + @end_date.strftime("%D") if @end_date
        dates = "N/A" if !dates
        return dates
      end
  end
  def format_name
    @site_name ? @site_name : ""
  end

  def format_priority
      value = Rainbow(" ⇧").bg(:yellow).colorize(:red) if @priority == "high"
        value = " ⇨".colorize(:orange) if @priority == "medium"
        value = " ⇩".colorize(:green) if @priority == "low"
        value = "" if !@priority
        return value
  end


end
