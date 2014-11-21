class CommentMailer < ActionMailer::Base
  default from: "from@example.com"
 
  def welcome_email(comment)
    @comment = comment
    @url  = "http://example.com/login"
    mail(:to => comment.email, :subject => "Welcome to My Awesome Site")
  end
end
