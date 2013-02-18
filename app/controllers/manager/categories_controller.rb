# *-*  coding: utf-8  *-*
class Manager::CategoriesController < ApplicationController
  layout "manager"

  def index
    @categories = Category.order("sort")
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def insert
    parent_category = Category.find(params[:id])
    @category = Category.new
    @category.parent_id = params[:id]
    @category.company_id = parent_category.company_id

    render :action => "new"
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to manager_categories_path, :notice => "成功新增内容:#{@category.title}"
    else
      render :action => "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to manager_categories_path, :notice => "内容:#{@category.title}更新完成。"
    else
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to manager_categories_path
  end

  # 批量删除
  def bat_del
    @categories = Category.find(params[:category_ids])
    @categories.each do |category|
      category.destroy
    end

    redirect_to manager_categories_path
  end
end
