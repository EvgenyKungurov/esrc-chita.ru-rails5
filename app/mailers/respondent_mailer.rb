class RespondentMailer < ApplicationMailer
  def new_question(user)
    recipients = [
     'general@soczashita-chita.ru',
     'opsv@soczashita-chita.ru',
     'kadry@soczashita-chita.ru'
    ]
    @user = user
    @url  = 'http://example.com/login'
    mail(to: recipients, subject: 'Новый вопрос на сайте ГКУ "КЦСЗН" Забайкальского края')
  end
end
