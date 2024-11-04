class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def new
        @tweet = Tweet.new
      end

      def index
        @tweets = Tweet.all
      
        if params[:tag_ids]
          @tweets = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_tweets = Tag.find_by(name: key).tweets
              @tweets = @tweets.empty? ? tag_tweets : @tweets & tag_s
            end
          end
        end

    end  
    
      def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @tweet = Tweet.find(params[:id])
      end 

      def edit
        @tweet = Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end
    
      private
      def tweet_params
        params.require(:tweet).permit(:name, :genre, :address, :menu, :about, :image, :overall, :lat, :lng, tag_ids:[])
      end
      
     #ここまで

end




