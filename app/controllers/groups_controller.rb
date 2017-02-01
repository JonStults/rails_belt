class GroupsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @groups = Group.all
    render 'groups'
  end

  def show
		@group = Group.find(params[:id])
		@member = Member.all
    @user = User.find_by_id(session[:user_id])
	end

  def create
    user = User.find_by_id(session[:user_id])
    group = Group.create(name:params[:name],description:params[:description], user:user)
    members = Member.create(group:group,user:user)
    if !group.errors.blank?
      puts group.errors.messages
      flash[:errors] = group.errors.messages
      return redirect_to '/groups'
    end
    return redirect_to '/groups'
  end

  def join_group
    @user = User.find_by_id(session[:user_id])
    @group = Group.find(params[:group_id])
    @member = Member.create(user: @user, group: Group.find(params[:group_id]))
    redirect_to "/groups/#{@group.id}"
  end

  def leave_group
    @user = User.find_by_id(session[:user_id])
    @group = Group.find(params[:group_id])
    @member = Member.find_by(user: @user, group: Group.find(params[:group_id])).destroy
    redirect_to "/groups/#{@group.id}"
  end

  def destroy_group
    group = Group.find(params[:group_id]).destroy
    redirect_to '/groups'
  end
end
