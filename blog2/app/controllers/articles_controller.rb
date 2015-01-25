class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy] #pass the method name :find_article, and it runs this before anything else

#Give user ability to create new articles
	def new
		@article = Article.new #the whole form is like a blank article
	end

#Create new article
	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params) #only allows certain parameters to be submitted. article_params (a private method) is required, which in turn only permits title and body.

		if @article.save # if article is sucessfully saved,...
			redirect_to @article # then redirect to that article...
		else
			render :new # otherwise, render the form again, so user can correct mistakes
		end
	end

#Show specific article
	def show
		@article = Article.find(params[:id])
	end

#List all articles
	def index
		@articles = Article.all # .all class method on Article class
	end

#Find specific article to edit
	def edit
		# @article = Article.find(params[:id])  #private method find_article applies to all routes, so load it as before_action (above)
	end
#Update article
	def update
		# @article = Article.find(params[:id])   #see 'before_action' above
		if @article.update_attributes(article_params)
			redirect_to @article
		else
			render :edit
		end

#Destroy article
	def destroy  #no view needed for the delete method
		# @article = Article.find(params[:id])
		@article.destroy
		redirect_to article_path
	end


private  #only allows these methods to be accessible to an instance of a class. can't be directly called by user.
	def article_params
		params.require(:article).permit(:title, :body) #only these parameters are allowed to be submitted by user.
	end

	def find_article
		@article = Article.find(params[:id]) #this allows you to delete it everywhere else
	end

end
