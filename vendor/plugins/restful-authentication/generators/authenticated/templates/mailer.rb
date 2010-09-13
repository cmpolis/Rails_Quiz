class <%= class_name %>Mailer < ActionMailer::Base
  def signup_notification(<%= file_name %>)
    setup_email(<%= file_name %>)
    @subject    += 'Please activate your new account'
  <% if options[:include_activation] %>
    @body[:url]  = "http://quizir.com/activate/#{<%= file_name %>.activation_code}"
  <% else %>
    @body[:url]  = "http://quizir.com/login/" <% end %>
  end
  
  def activation(<%= file_name %>)
    setup_email(<%= file_name %>)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://quizir.com/"
  end
  
  protected
    def setup_email(<%= file_name %>)
      @recipients  = "#{<%= file_name %>.email}"
      @from        = "admin@quizir.com"
      @subject     = "Quizir.com "
      @sent_on     = Time.now
      @body[:<%= file_name %>] = <%= file_name %>
    end
end
