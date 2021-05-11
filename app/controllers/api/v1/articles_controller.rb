module Api
	module V1
		class ArticlesController < ApplicationController

      def index
        @articles = Article.order('created_at DESC');
        render json: { status: 'SUCCESS', message: 'loaded articles', data:@articles}, status: :ok
      end
      def show
        @article = Article.find(params[:id])
        render json: { status: 'SUCCESS', message: 'loaded article', data:@articles}, status: :ok
      end

      def create
        @article = Article.new(article_params)
        if @article.save
          render json: { status: 'SUCCESS', message: 'articles created', data:@articles}, status: :ok
        else
          render json: { status: 'Error', message: 'fail to create articles', data:@articles.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
        render json: { status: 'SUCCESS', message: ' article  deleted', data:@articles}, status: :ok
      end
      def edit
        @article = Article.find(params[:id])
      end

      def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          render json: { status: 'SUCCESS', message: 'articles created', data:@articles}, status: :ok
        else
          render json: { status: 'Error', message: 'fail to update articles', data:@articles.errors}, status: :unprocessable_entity
        end
      end
      private
        def article_params
          params.require(:article).permit(:title, :body)
        end
		end
	end
end