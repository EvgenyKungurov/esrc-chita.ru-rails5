class RespondentMailer < ApplicationMailer
  def new_question(user)
   recipients = [
     'general_esrc@esrc-zbp.ru',
     'kro_esrc@esrc-zbp.ru',
     'kadry_esrc@esrc-zbp.ru'
   ]
   @user = user
   @url  = 'http://example.com/login'
   mail(to: recipients, subject: 'Новый вопрос на сайте ГКУ "КЦСЗН" Забайкальского края')
 end
end
