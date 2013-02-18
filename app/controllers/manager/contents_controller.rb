# *-* coding:utf-8 *-*
class Manager::ContentsController < ApplicationController
  layout "manager"

  def index
    @contents = Content.order("sort")
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def insert
    parent_content = Content.find(params[:id])
    @content = Content.new
    @content.parent_id = params[:id]
    @content.company_id = parent_content.company_id

    render :action => "new"
  end

  def create
    @content = Content.new(params[:content])

    if @content.save
      redirect_to manager_contents_path, :notice => "成功新增内容:#{@content.title}"
    else
      render :action => "new"
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])

    if @content.update_attributes(params[:content])
      redirect_to manager_contents_path, :notice => "内容:#{@content.title}更新完成。"
    else
      render :action => "edit"
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    redirect_to manager_contents_path
  end

  def bat_del
    @contents = Content.find(params[:content_ids])
    @contents.each do |content|
      content.destroy
    end

    redirect_to manager_contents_path
  end
end
