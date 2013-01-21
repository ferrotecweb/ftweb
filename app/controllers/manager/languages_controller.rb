# *-* coding:utf-8 *-*
class Manager::LanguagesController < ApplicationController
  layout "manager"
  def index
    @languages = Language.all
  end

  def show
    @lan = Language.find(params[:id])
  end

  def new
    @lan = Language.new
  end

  def create
    @lan = Language.new(params[:language])

    if @lan.save
      redirect_to manager_languages_path, :notice =>"新语言#{@lan.memo}已经成功增加！"
    else
      render :action=>"new"
    end
  end

  def edit
    @lan = Language.find(params[:id])
  end

  def update
    @lan = Language.find(params[:id])

    if @lan.update_attributes(params[:language])
      redirect_to manager_languages_path, :notice =>"#{@lan.memo}已经更新！"
    else
      render :action=>"edit"
    end
  end

  def destroy
    @lan = Language.find(params[:id])
    @lan.destroy

    redirect_to manager_languages_path
  end
end
