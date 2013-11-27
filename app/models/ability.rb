class Ability
  include CanCan::Ability
  def initialize(user)
    #can :read, :all
    #can :access, :rails_admin   # grant access to rails_admin
    #can :dashboard                    # allow everyone to read everything
    can :access, :rails_admin
    if user && user.role?(:admin)
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      can :manage, :all
    elsif user && user.role?(:seo)
      can :manage, :all             # allow superadmins to do anything
      can :access, :rails_admin
    elsif user && user.role?(:manager)
      cannot :index, [Site, User]
      can :access, :rails_admin
      can :dashboard
      can :show, [Page], site: {user_id: user.id}
      can :index, [Page], site: {user_id: user.id}
      can :create, [Page], site: {user_id: user.id}
      can :edit, [Page], site: {user_id: user.id}  # allow managers to do anything to products and users
      can :update, [Page], site: {user_id: user.id}
      #cannot :edit, [Page], :title
      can :nestable, [Page], site: {user_id: user.id}
      cannot :index, :pages, :site

      can :show, [Post], site: {user_id: user.id}
      can :index, [Post], site: {user_id: user.id}
      can :create, [Post], site: {user_id: user.id}
      can :edit, [Post], site: {user_id: user.id}  # allow managers to do anything to products and users
      can :update, [Post], site: {user_id: user.id}
      #cannot :edit, [Page], :title
      can :nestable, [Post], site: {user_id: user.id}
      cannot :index, :posts, :site
    elsif user && user.role?(:none)
      #cannot  :access, :rails_admin
      #can :update, Product, :hidden => false  # allow sales to only update visible products
    else
      #can :read, :all
      #cannot :access, :rails_admin
      #cannot :manage, :all
      #cannot :dashboard
    end
  end
end