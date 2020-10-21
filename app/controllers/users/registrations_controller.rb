class Users::RegistrationsController < Devise::RegistrationsController
  def index
  end
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end
end
