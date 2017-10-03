class PostsController < ApplicationController
	#1
  def create
  	@user = User.find_or_create_by(login: params[:login])
  	@post = @user.posts.new(permit_params)
  	if @post.save
  		render json: @post, status: 200
  	else 
  		render json: @post.errors, status: 422
  	end
  end
  #2
  def update
  	@post = Post.find(params[:id])
  	@ratings = @post.ratings.new(ratings_params)
  	if 	@ratings.save
  		@avg_rating = Rating.select("floor(sum(grade)/ count(post_id))").group("post_id").having('post_id = ?', @post.id)
  		render json: @avg_rating,  status: 200
  	else
  		render json: @post.errors, status: 418
  	end
  end	
  #3
  def index
  	@posts = Post.find_by_sql("select p.title, p.body from posts as p join ratings as r on p.id = r.post_id	and floor(r.grade) = (select floor(avg(grade)) from ratings) order by title")
    render json: @posts
  end
  #4
  def show
  	@ip_list = Post.find_by_sql("select p1.ip, u1.login from posts p1 join posts p2 on p1.ip = p2.ip and p1.user_id != p2.user_id join users u1 on p1.user_id = u1.id or p2.user_id = u1.id")
  	render json: @ip_list
  end

  private 

  def permit_params
 		params.fetch(:post, {}).permit(:title, :body, :ip, :user_id)
 	end

 	def ratings_params
 		params.fetch(:post, {}).permit(:grade)
 	end
end
