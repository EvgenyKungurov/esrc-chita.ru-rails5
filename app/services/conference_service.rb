class ConferenceService
  attr_reader :current_user, :url, :errors

  def initialize(current_user)
    @current_user = current_user
    @default_url  = 'http://conf.soczashita-chita.ru/bigbluebutton/api/join?'
  end

  def call
    if current_user && (current_user.has_role? :conference)
      bbb_salt = ENV['BBB_SALT']
      email    = current_user.email
      query    = "meetingID=ESRC%27s+meeting&fullName=#{email}&password=mp"
      checksum_string = "join#{query}#{bbb_salt}"
      checksum = Digest::SHA1.hexdigest checksum_string
      @url = "#{@default_url}#{query}&checksum=#{checksum}"
    else
      @errors = 'Данный пользователь не имеет доступа к вебконференции'
    end
    self
  end

  def success?
    errors.nil?
  end
end
