class PostMailer < ActionMailer::Base
  default from: "from@example.com"
   def post_intimation(reciever,sender,body)
    @posts = Post.all
    mail(:from => sender, :to => reciever, :subject => "new post created")
  end
end
