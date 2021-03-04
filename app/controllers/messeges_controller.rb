class MessegesController < ApplicationController
  before_action :set_group

  def index
    @messege = Messege.new
    @messeges = @group.messeges.includes(:user)
  end

  def create
    @messege = @group.messeges.new(messege_params)
    if @messege.save
      redirect_to group_messeges_path(@group), notice: 'メッセージが送信されました'
    else
      @messeges = @group.messeges.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def messege_params
    params.require(:messege).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
