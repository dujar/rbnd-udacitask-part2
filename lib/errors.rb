module UdaciListErrors
  # Error classes go here
    class InvalidPriorityValue < StandardError
    end
    class InvalidTypeError < StandardError
    end
    class IndexExceedsListSize < StandardError
    end
    class InvalidNumberOfArguments < StandardError
    end
end
