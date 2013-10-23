# A comment policy is a Pundit class to manage blog comments
class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment, :author

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    if comment.author.present?
      user.author? || user.editor?
    end
  end
  alias_method :update?, :create?


  def approve?
    if user.present?
      user.editor?
    end
  end

  def destroy?
    if user.present?
      return true if user.editor?
      user.id == comment.author
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end
end
