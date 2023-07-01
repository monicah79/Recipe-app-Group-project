class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Recipe, public: true

    return unless user.present?

    can :manage, Recipe, user_id: user.id
    can :manage, Inventory, user_id: user.id
    can :manage, Food
    can :manage, InventoryFood
    can :manage, RecipeFood, user_id: user.id

    return unless user.role == 'admin'

    can :manage, :all
  end
end
