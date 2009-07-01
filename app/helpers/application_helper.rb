# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_sex(sex)
    case sex
    when 'm'
      '男'
    when 'f'
      '女'
    end
  end
  
  def format_age(birth)
    Time.now.year - birth.strftime("%Y").to_i
  end
  
  def state_type(type)
    (type == 'error') ? 'error' : 'highlight'
  end
  
end
