class UserAuthenticator
  class Result
    include Virtus.model

    attribute :new_user, Boolean, default: false
    attribute :user, User

    def new_user?
      new_user
    end
  end

  def initialize(auth0_uid:, auth0_info:)
    @auth0_uid = auth0_uid
    @auth0_info = auth0_info
  end

  def call
    user = User.find_by(auth0_uid: @auth0_uid)

    if user.present?
      result = Result.new(user: user)
    else
      user = User.create(
        auth0_uid: @auth0_uid,
        email: @auth0_info.fetch('email'),
        name: @auth0_info.fetch('name', nil),
      )

      result = Result.new(new_user: true, user: user)
    end

    user.update(last_auth_at: Time.now)

    result
  end
end
