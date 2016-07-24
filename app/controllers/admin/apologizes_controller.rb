class Admin::ApologizesController < ApplicationController
  before_action :set_apologize, only: [:show, :edit, :update, :destroy]
  before_action :set_authors, only: [:new, :edit]

  def index
    @apologizes = Apologize.all
  end


  def show
  end


  def new
    @apologize = Apologize.new
  end


  def edit
  end


  def create
    @apologize = Apologize.new(apologize_params)

      if @apologize.save
        redirect_to [:admin,@apologize], notice: 'Desculpa esfarrapada cadastrada com sucesso.'
      else
         render :new
      end
  end


  def update

      if @apologize.update(apologize_params)
        redirect_to [:admin,@apologize], notice: 'Desculpa esfarrapada cadastrada com sucesso.'
      else
        render :edit
      end
  end

  def destroy
    @apologize.destroy
    redirect_to admin_apologizes_url, notice: 'Deletado.'
  end

  private
    def set_authors
      @authors = Author.all.collect{|author| [author.name, author.id]}
    end

    def set_apologize
      @apologize = Apologize.find(params[:id])
    end


    def apologize_params
      params.require(:apologize).permit(:apologize_image, :description, :author_id)
    end
end
