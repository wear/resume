# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
                   
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
  :default => "%m/%d/%Y",
  :date_edu => "%m/%Y",
  :date_time12 => "%m/%d/%Y %I:%M%p",
  :date_time24 => "%m/%d/%Y %H:%M"
)

