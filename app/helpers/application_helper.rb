module ApplicationHelper
  ACTIVE_CLASS = 'is-active'.freeze
  ACTIVE_CLASS2 = 'is-active-image'.freeze

def active_for(options)
  name_of_controller = options.fetch(:controller) { nil }
  name_of_action     = options.fetch(:action) { nil }
  request_path       = options.fetch(:path) { nil }

  return ACTIVE_CLASS if request_path && request_path == request.path

  if name_of_controller == controller_name
    ACTIVE_CLASS if name_of_action.nil? || (name_of_action == action_name)
  end
end

def active_profile(options)
  name_of_controller = options.fetch(:controller) { nil }
  name_of_action     = options.fetch(:action) { nil }
  request_path       = options.fetch(:path) { nil }

  return ACTIVE_CLASS2 if request_path && request_path == request.path

  if name_of_controller == controller_name
    ACTIVE_CLASS2 if name_of_action.nil? || (name_of_action == action_name)
  end
end
end
