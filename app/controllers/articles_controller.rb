class ArticlesController < ApplicationController
def index
	@articles = Article.all

end

	def new
		@article = Article.new
	end
	def create
		#render plain: params[:article].inspect #display in browser what is being savaed
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was Created successfully"
			redirect_to articles_path(@article)
		else
			render 'new'
		end
	end
	def edit
		@article = Article.find(params[:id])

	end
def update
	@article = Article.find(params[:id])
	if @article.update(article_params)
		flash[:notice] = "Article was udpated successfully"
		redirect_to article_path(@article)
	else
		render 'edit'
	end

end


def show

	@article = Article.find(params[:id])

end
def destroy
	@article = Article.find(params[:id])
	@article.destroy
	flash[:notice] = "Article was deleted sucessfully"
	redirect_to articles_path


end


	private
	def article_params
		params.require(:article).permit(:title, :description)
	end


end

