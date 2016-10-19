module ApplicationHelper
  def full_title(page_title)
    base_title = 'ГКУ "КЦСЗН" Забайкальского края официальный сайт'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def meta_description(content)
    strip_tags(content[0..255]).tr('&nbsp;', ' ').tr('&quot;', '').strip.squeeze
  end
end
