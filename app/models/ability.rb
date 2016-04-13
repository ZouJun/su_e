class Ability
  include CanCan::Ability

  def initialize(user)

    # alias_action :create, :read, :update, :to => :crud
    if user.teacher?
      # alias_action :create, :read, :update, :to => :crud
      can :read, :all
      can :create, Notice
      can :create, Message
      can :create, Document
      # can :create, Grade
      can :update, :all
        #   Student do |m|
        # m.teacher.id == user.owner.id
      # end
    elsif user.student?
      can :read, :all
      can :create, Message
      can :create, Student
      can :create, Document
      # can :update, :all
    end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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

    #超级管理员认证################
    is_admin = false
    $admin_users.each do |admin|
      item_admin = true
      #每个项认证
      admin.each do |item, value|
        item_admin = item_admin && user[item] == value
      end
      is_admin = is_admin || item_admin
    end
    can :manage, :all if is_admin
    ##############################

    alias_action :show_group, :read, :to => :show_task
    alias_action :split_new, :split_create, :read, :to => :split

    #基础权限
    # can [:tree_data], [Person, Department, Organization]
    # can [:load_department_by_person, :validate_person, :update_password, :sync_data], Person
    # can [:load_by_org_for_select], Department

    #orgs = present_and_sort(Organization.find(user.organization_id).self_and_descendants).map{|org| org.id}
    #can :manage, Person, ['organization_id IN (?)', can_organization(user)] do |person|
    #  can_organization(user).include?(entity.organization_id)
    #end

    permissions = user.permissions
    permissions.each do |permission|
      if permission.code.present? #有code筛选
        if permission.fetching.present? #有查询筛选
          can eval(permission.action), eval(permission.subject), eval(permission.fetching) do |entity|
            eval(permission.code)
          end
        else #只有code筛选
          can eval(permission.action), eval(permission.subject) do |entity|
            eval(permission.code)
          end
        end
      elsif permission.fetching.present? #只有查询筛选
        can eval(permission.action), eval(permission.subject), eval(permission.fetching)
      else #无筛选
        # can permission.action.to_sym, permission.subject
        can eval(permission.action), eval(permission.subject)
      end
    end

  end

  #可以操作的单位ID集合
  def can_organization(user)
    orgs = present_and_sort(Organization.find(user.organization_id).self_and_descendants).map { |org| org.id }
  end
end
