require "action_mailer"
module ExceptionNotification
  autoload :Notifiable,     'exception_notification/notifiable'
  autoload :Notifier,       'exception_notification/notifier'
  #autoload :NotifierHelper, 'exception_notification/notifier_helper'
  autoload :ConsiderLocal,  'exception_notification/consider_local'
end

class Object
  # Allows for notifying about any exception from any object
  def report_exception(exception, subsections={})
    ExceptionNotification::Notifier.deliver_exception_only(exception, subsections)
  end
end