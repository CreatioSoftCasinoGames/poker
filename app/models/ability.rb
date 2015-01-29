class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is? "ADMIN"
        can :manage, :all
    end
  end
end
    