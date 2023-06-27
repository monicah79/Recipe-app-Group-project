class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, Recipe
      can :create, Recipe
      can :update, Recipe, user_id: user.id
      can :destroy, Recipe, user_id: user.id
    end
  end
end
