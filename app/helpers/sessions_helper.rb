module SessionsHelper
  def can_do_it?
    unless authenticate_user! && (current_user.has_role? :admin || :editor)
      redirect_to root_path
    end
  end

  def enter_to_conference
    result = ConferenceService.new(current_user).call
    if result.success?
      content_tag(:li, link_to('Подключится к конференции', 
	'http://conf.soczashita-chita.ru/demo/create.jsp?action=invite&meetingID=ESRC%27s+meeting', target: '_blank'))
    end
  end
end
