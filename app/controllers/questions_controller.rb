class QuestionsController < ApplicationController
	def index
		@question=Question.all
		@member = Member.find(:all)
		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question }
    end
	end

	def new
		@question=Question.new
	end
	def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end
	def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'User was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

end
