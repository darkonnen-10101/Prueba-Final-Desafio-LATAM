# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.has_role? :admin
      # if user.role? :admin
        can :access, :rails_admin
        can :read, :dashboard
        can :manage, :all
        can :manage, Category, :all
        can :update, Category, :all
        can :create, Category, :all

      else

        # can :read, :all
        # can :create, Project
        # can :read, Comment
        # can :create, Comment
        # can :read, Category, :all, public: true
        # can :edit, Project, :all
        can :profile, User
        can :all, User



        can :all, Project, :all
        can :index, Project, :all
        can :new, Project, user_id: user.id
        can :create, Project, user_id: user.id
        can :display, Project, user_id: user.id
        can :show, Project, :all

        can :update, Project, user_id: user.id
        can :destroy, Project, user_id: user.id
        can :manage, Project, user_id: user.id

        can :create, Comment, user_id: user.id
        can :destroy, Comment, user_id: user.id


        # can :manage, Post
        # can :create, Comment
        # can [:create, :update], [Post, Comment]
        # can :read, Project, active: true
        # can :read, Project, user_id: user.id
        # can :read, Project, category: { visible: true }

      end


    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
