# *-* coding:utf-8 *-*
class Manager::CompaniesController < ApplicationController
  layout "manager"
  def index
    @companies = Company.all
  end

  def show
    @com = Company.all
  end

  def new
    @com = Company.new
  end

  def create
    @com = Company.new(params[:company])

    if @com.save
      redirect_to manager_companies_path, :notice => "新增公司:#{@com.name}"
    else
      render :action=> "new"
    end
  end

  def edit
    @com = Company.find(params[:id])
  end

  def update
    @com = Company.find(params[:id])

    if @com.update_attributes(params[:company])
      redirect_to manager_companies_path, :notice => "#{@com.name} 相关信息更新完成!"
    else
      render :action => "edit"
    end
  end

  def destroy
    @com = Company.find(params[:id])
    @com.destroy

    redirect_to manager_companies_path
  end
end
