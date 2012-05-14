class AnswersController < ApplicationController
before_filter :find_question
before_filter :find_ans,:only => [:show]
def index
	@answer=@question.Answer.all
end
	def new
	@answer=@question.answers.new
	end
	def create
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@question, @answer]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
    def show
    	 
    end
  end
	  private
    def find_question
      @question = Question.find(params[:question_id])
      # @question = Question.find(params[:comment])
    end
    def find_ans
    @answer = @question.answers.find(params[:id])
    	 logger.warn("==========#{@answer.inspect}")
    	 end
end

