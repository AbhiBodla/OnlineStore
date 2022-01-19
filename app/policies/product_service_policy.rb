class ProductServicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
   true
  end

  def update?
    user_is_owner_of_record?
  end

  def show?
    user_is_owner_of_record?
  end

  def create?

    @user.role == 'admin' || @user.role == 'seller'
  end
  
  def soft_destroy?
    user_is_owner_of_record? 
  end

  def new?

    @user.role == 'admin' || @user.role == 'seller'
  end

  def edit?
    user_is_owner_of_record?
  end

  def destroy?
  user_is_owner_of_record?
  end

  def user_is_owner_of_record?

    @user.id == @record.user_id || @user.role == 'admin'

    
  end


end
