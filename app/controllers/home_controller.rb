class HomeController < ApplicationController
  def index
    if user_signed_in?
	  @enrolls = Enroll.all.where(user: current_user).order("created_at DESC")
	  @posts = Post.all
      @myposts = Post.all.where(user: current_user).order("created_at DESC")
      @comments = Comment.all
      @mycomments = Comment.all.where(user: current_user).order("created_at DESC")
      @rewards = Rewardpurchase.all
      @myrewards = Rewardpurchase.all.where(user: current_user).where.not(id: Redeem.select(:rewardpurchase_id))
    elsif business_signed_in?
      @rewards = Reward.all
      @myrewards = Reward.all.where(business: current_business)
    else
      @search = Post.ransack(params[:q])
      @posts = @search.result.includes(:comments)
    end
  end  

  def businessinfo
  end

  def profsignup
  end

  def userpage
    @users = User.all
  end
end
