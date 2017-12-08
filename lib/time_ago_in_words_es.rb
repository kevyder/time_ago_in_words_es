require 'time_ago_in_words_es/version'
require 'time_ago_in_words_es/engine' if defined?(Rails) && defined?(Rails::Engine)
require 'time_ago_in_words_es/action_view_methods' if defined? ActionView

module TimeAgoInWordsEs
  ActionView::Base.send :include, ActionViewMethods
end
