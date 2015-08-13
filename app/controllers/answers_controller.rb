class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, except: [:create]

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to question_path(@answer.question_id), notice: "Cevabınız başarı ile kayıt edildi."
    else
      redirect_to question_path(@answer.question_id), alert: "Bir Hata Oluştu..."
    end
  end

  def edit
    redirect_to question_path(@answer.question_id), alert: "Yetkisiz Erişim..." unless permitted?
  end

  def update
    redirect_to question_path(@answer.question_id), alert: "Yetkisiz Erişim..." unless permitted?
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question_id), notice: "Başarılı bir düzenleme.."
    else
      render :edit, alert: "Bir Hata Oluştu.."
    end
  end

  def destroy
    
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def permitted?
    current_user == @answer.user
  end

  def answer_params
    params.require(:answer).permit(:comment, :question_id)
  end
end
