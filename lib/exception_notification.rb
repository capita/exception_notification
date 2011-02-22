require "action_mailer"
module ExceptionNotification
  autoload :Notifiable,     'exception_notification/notifiable'
  autoload :Notifier,       'exception_notification/notifier'
  #autoload :NotifierHelper, 'exception_notification/notifier_helper'
  autoload :ConsiderLocal,  'exception_notification/consider_local'
  autoload :GenericNotifier, 'exception_notification/generic_notifier'  
  autoload :ExceptionContext, 'exception_notification/exception_context'  
end

Object.send(:include, ExceptionNotification::GenericNotifier)
Exception.send(:include, ExceptionNotification::ExceptionContext)
