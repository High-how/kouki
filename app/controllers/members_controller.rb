class MembersController < ApplicationController
  def index
    @members = Member.all.includes(:user)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @member1 = Member.where(spring: "1")
    @member2 = Member.where(summer: "1")
    @member3 = Member.where(autumn: "1")
    @member4 = Member.where(winter: "1")
  end

  private
  def member_params
    params.require(:member).permit(:name, :tel, :birthday, :postcode, :city, :block, :building, :secularname, :dharmaname, :deceased, :spring, :summer, :autumn, :winter)
  end

end
