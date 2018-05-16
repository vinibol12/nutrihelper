Time::DATE_FORMATS[:day_date_time]  = '%a, %e %b %y %l:%M %p'
Time::DATE_FORMATS[:human_schedule] = lambda do |time|
  time.strftime("%A #{time.day.ordinalize} %B at %-l:%M%P")
      .gsub(':00', '')
end
Time::DATE_FORMATS[:weekday_and_day_of_year] = '%a, %b %e %Y'