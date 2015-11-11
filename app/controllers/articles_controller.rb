class ArticlesController < ApplicationController
   
    before_action :if_admin, except: [:index, :show]
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def edit
    
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
    def update
    
    end
    
    def destroy
    
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text) 
    end

end
