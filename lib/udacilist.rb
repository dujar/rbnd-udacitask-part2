class UdaciList
  attr_accessor :title, :items

  def initialize(options={})
      @title = options[:title]|| Rainbow("Untitled List").bg(:red)
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if  type == "event" || type == "link" || type == "todo"
     type
    else
     raise UdaciListErrors::InvalidTypeError, "Incorrect type! Only todo, event, link allowed. Not #{description}"
    end

    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
    
  end
  def delete(index)
    if @items.delete_at(index - 1) == nil
        raise UdaciListErrors::IndexExceedsListSize, " There is no item to delete there, only #{@items.count} items."
    else
        @items.delete_at(index-1)
    end

  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

  def filter item
      case item
      when "event"
          selected = EventItem
      when "list"
          selected = LinkItem
      when "todo"
          selected = TodoItem
      end
      theone =[]
     @items.each do |select|
          if select.class == selected
              theone << select
          end
      end

      return theone
  end
end
