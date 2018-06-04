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
    @channel = channel
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

  def deliver
    begin
      Net::HTTP.post_form(@uri, @params)
    rescue => e
      Rails.logger.error("BespokeSlackbotService: Error when sending: #{e.message}")
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
end
