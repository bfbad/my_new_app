class Ability
  include CanCan::Ability

  # Allows users to manage themselves
  def initialize(user)
    user ||= User.new #guest user (not logged in)
    can :manage, User, id: user.id
  end

end
