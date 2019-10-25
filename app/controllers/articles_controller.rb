class ArticlesController < ApplicationController
	#thse should all set_atcile before they fun
	before_action :set_article , only: [:edit, :update, :show, :destroy]

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

	end
def update
	if @article.update(article_params)
		flash[:notice] = "Article was udpated successfully"
		redirect_to article_path(@article)
	else
		render 'edit'
	end

end


def show


end
def destroy
	@article.destroy
	flash[:notice] = "Article was deleted sucessfully"
	redirect_to articles_path


end


	private
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end


end

