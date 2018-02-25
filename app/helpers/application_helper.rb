module ApplicationHelper
  # time format with local
  #
  # format :default, :long, :short
  def time_format(time, format = :long)
    I18n.l time, format: format if time.present?
  end

  def time_tag(time)
    content_tag :time, time_format(time), datetime: time.strftime('%FT%R%z') if time.present?
  end
end
