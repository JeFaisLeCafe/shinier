class SlackPost
  NAME_AND_ICON = {
      username: 'Shinier Bot',
      icon_emoji: ':star2:'
  }

  GOOD = 'good'
  WARNING = 'warning'
  DANGER = 'danger'

  def initialize(channel = ENV['SLACK_WEBHOOK_CHANNEL'])
    @uri = URI(ENV['SLACK_WEBHOOK_URL'])
    if Rails.env.development?
      @channel = "#diabete-dev"
    else
      @channel = channel
    end
  end

  def clicky_clicky(user, some, other, info)
    params = {
        attachments: [
            {
                title: 'Wibble button clicked',
                fallback: 'Wibble button clicked',
                color: GOOD,
                fields: [
                    {
                        title: 'User',
                        value: user,
                        short: true
                    },
                    {
                        title: 'Some',
                        value: some,
                        short: true
                    },
                    {
                        title: 'Other',
                        value: other,
                        short: true
                    },
                    {
                        title: 'Info',
                        value: info,
                        short: true
                    }
                ]
            }
        ]
    }
    @params = generate_payload(params)
    self
  end

  def post_new_user(user)
    params = {
      attachments: [
        {
          title: 'Un nouvel utilisateur Shinier est arrivé!',
          fallback: 'new_user_here',
          color: GOOD,
          text: "BIenvenue sur Slack, @#{user.slackname}! Tu peux désormais rentrer en contact avec d'autres membres de Shinier!"
        }
      ]
    }
    @params = generate_payload_admins(params)
    self
  end

  def post_new_question(question)
    params = {
      attachments: [
        {
          title: "Une nouvelle question a été posée, quelqu'un a besoin de toi!",
          fallback: 'new_question_asked',
          color: WARNING,
          text: "Répondre à la question : " + Rails.application.routes.url_helpers.question_url(question.id)
        }
      ]
    }

    @params = generate_payload(params)
    self
  end

  def send_invite(user)
    RestClient.get("https://slack.com/api/users.admin.invite?token=#{ENV['SLACK_TOKEN_2']}&email=#{user.email}")
  end

  def deliver
    begin
      # Net::HTTP.post_form(@uri, @params)
      RestClient.post(ENV['SLACK_WEBHOOK_URL'], @params)
    rescue => e
      Rails.logger.error("ShinierBot: Error when sending: #{e.message}")
    end
  end

  private

  def generate_payload(params)
    {
        payload: NAME_AND_ICON
                     .merge(channel: @channel)
                     .merge(params).to_json
    }
  end
  def generate_payload_admins(params)
    {
        payload: NAME_AND_ICON
                     .merge(channel: "#devteam")
                     .merge(params).to_json
    }
  end
end
