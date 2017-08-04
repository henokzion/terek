class PagesController < ApplicationController
    def home
        redirect_to articles_path if logged_in?
        @articles = Article.paginate(page: params[:page], per_page: 10 )
    end
    def about

    end
end