#
# A generic notifier to report exceptions from any ruby object by invoking
# report_exception(err, "Metadata" => self.inspect (...))
#
module ExceptionNotification::GenericNotifier
  # Allows for notifying about any exception from any object
  def report_exception(exception, subsections={})
    ExceptionNotification::Notifier.deliver_exception_only(exception, subsections.merge(exception.context))
  end
end
