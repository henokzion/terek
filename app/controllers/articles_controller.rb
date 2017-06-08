class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def edit
        @article = Article.find(params[:id])
    end
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was Successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    def show
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was Successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    def destroy
        @aritcle = Article.find(params[:id])
        @aritcle.destroy
        flash[:notice] = "Article was deleted"
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
end