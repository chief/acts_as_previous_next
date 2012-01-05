class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when "admin"
      can :manage, :all
    when "user"
      can :manage, Post, user_id: user.id
    end
  end
end
