#
# Extension for ruby exceptions to give them a hash that can carry around
# additional context
#
module ExceptionNotification::ExceptionContext
  def context
    @context ||= Hash.new
  end
end
