# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title page_title
    content_for(:title) { page_title }
  end

  # simple admin check for now...
  def user_is_admin?
    !current_user.nil? and current_user.id == 1
  end

  def time_ago time
    a = (Time.now-time).to_i

    case a
    when 0 then return 'just now'
    when 1 then return 'a second ago'
    when 2..59 then return a.to_s+' seconds ago'
    when 60..119 then return 'a minute ago' #120 = 2 minutes
    when 120..3540 then return (a/60).to_i.to_s+' minutes ago'
    when 3541..7100 then return 'an hour ago' # 3600 = 1 hour
    when 7101..82800 then return ((a+99)/3600).to_i.to_s+' hours ago'
    when 82801..172000 then return 'a day ago' # 86400 = 1 day
    when 172001..518400 then return ((a+800)/(60*60*24)).to_i.to_s+' days ago'
    when 518400..1036800 then return 'a week ago'
    end
    return ((a+180000)/(60*60*24*7)).to_i.to_s+' weeks ago'
  end

end
