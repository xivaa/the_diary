class NotePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def index?
      true
    end

    def create?
      true
    end

    def destroy?
      record.user == user
    end
  end
end
