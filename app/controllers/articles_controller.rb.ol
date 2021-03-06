class ArticlesController < ApplicationController

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

def show

	@article = Article.find(params[:id])

end


	private
	def article_params
		params.require(:article).permit(:title, :description)
	end


end

