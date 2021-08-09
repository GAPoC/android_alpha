require 'date'

Then('I tap the {string} button once from the calendar view') do |status|
  @current_month = on(ScoresScreen).get_calendar_month_txt

  case status
  when 'previous'
    on(ScoresScreen).tap_on_calendar_previous_btn
  when 'next'
    on(ScoresScreen).tap_on_calendar_nxt_btn
  end
  ReusableFunction.wait_for(3)
end

Then('the calendar changes to the {string} month') do |string|
  case string
  when 'previous'
    prev_month = Time.new.to_datetime.prev_month.strftime('%B %Y').to_s
    raise('Inaccurate Calendar Data') if prev_month.eql?(@current_month)
  when 'next'
    next_month = Time.new.to_datetime.next_month.strftime('%B %Y').to_s
    raise('Inaccurate Calendar Data') if next_month.eql?(@current_month)
  when 'today'
    on(ScoresScreen).tap_on_scores_current_date
  end
end

Then('I tap the {string} button until the last month from the calendar view') do |string|
  case string
  when 'previous'
    on(ScoresScreen).tap_on_calendar_previous_btn until on(ScoresScreen).check_prev_caret_attr.to_s.eql?('false')
  when 'next'
    on(ScoresScreen).tap_on_calendar_nxt_btn until on(ScoresScreen).check_next_btn_attr.to_s.eql?('false')
  end
end

Then('I select a date from the scores calendar') do
  on(ScoresScreen).tap_on_scores_current_date
  on(ScoresScreen).select_a_scores_date('future')
end