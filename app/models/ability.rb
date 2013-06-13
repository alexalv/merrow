class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.nil?
        can :read, :virtual_machines
    elsif user.admin?
        can :manage, :all
    else
        can :manage, VirtualMachine
        cannot :read, :users, :servers
    end
  end
end
