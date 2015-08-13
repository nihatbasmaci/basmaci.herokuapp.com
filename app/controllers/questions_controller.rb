class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to root_path, notice: "Kayıt Başarılı"
    else
      render :new, alert: "Kayıt işlemi yapılırken bir hata ile karşılaşıldı."
    end
  end

  def edit
    redirect_to root_path, alert: "Yetkisiz Erişim." unless permitted?
  end

  def update
    redirect_to root_path, alert: "Yetkisiz Erişim." unless permitted?
    if @question.update(question_params)
      redirect_to @question
    end

  end

  def destroy
    @question.delete
    redirect_to root_path
  end

  def date
    array = []
    params[:question].each { |k,v| array << v }
    @date = Question.where( :created_at => (array.reverse.join("-").to_datetime..Date.today))
  end

  private

  def permitted?
    current_user == @question.user
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :tag_ids => [])
  end
end
