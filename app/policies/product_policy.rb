class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve     
      scope.all     
    end
  end
   
def index?
  true
end

def new?
  @user.role == 'admin' || @user.role == 'seller'
end

def create?
  @user.role == 'admin' || @user.role == 'seller'
end

def destroy?
  user_is_owner_of_record? 
end

def update?
  user_is_owner_of_record? 
end

def show?
true 
end

def edit?
true
end

def user_is_owner_of_record?      
  
    @user == @record.user  || @user.role == 'admin' 
  
end
end
