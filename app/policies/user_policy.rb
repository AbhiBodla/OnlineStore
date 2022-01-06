class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
   def index?
      @user.role == 'admin' 
   end

   def show?
    
   end

 
   def edit?
   update?
  
   end

   def destroy?
   @user.role == 'admin'
   end
end
