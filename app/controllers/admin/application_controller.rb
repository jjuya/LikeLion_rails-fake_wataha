class Admin::ApplicationController < ApplicationController

  layout 'admin'

  before_action :check_admin

  private
  def check_admin
    # 지금 접속한 회원이 관리자인지 판별
    # 아닐 겅우 root로 보내기
    unless user_signed_in? && current_user.admin?
      redirect_to(root_path, alert: "관리자 계정으로 로그인 하세요.")
    end
  end

end
