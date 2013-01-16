class WelcomeController < ApplicationController
  def index
    @subdomain = request.subdomain
  end

  def set_language
    session['I18n'] = ""    #将当前域名下的session值删除
    redirect_to Language.where(:code => params[:id]).first.link  # 跳转到别的语言子域名
  end
end
