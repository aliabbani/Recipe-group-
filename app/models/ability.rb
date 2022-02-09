# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Food, published: true

    return unless user.present?

    can [:read, :create, :destroy], Food, user: user
  end
end
