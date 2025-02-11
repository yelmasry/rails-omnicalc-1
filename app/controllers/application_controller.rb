class ApplicationController < ActionController::Base
  def home 
    render({ :template => "application_templates/home"})
  end 


  ###Square
  def square_new
    @the_num = params.fetch("user_number").to_f

    @the_result = @the_num ** 2
  
    render({ :template => "application_templates/square_new"})
  end 


  ###Square Root
  def square_root_new
    @the_num = params.fetch("users_number").to_f

    @the_result = @the_num ** 0.5

    render({ :template => "application_templates/square_root_new"})
  end 


  ###Payment
  def payment_new 
    @apr = ((params.fetch("APR_user").to_f) / 100 / 12 )    
  
    @years = (params.fetch("years_user")).to_i * 12 
  
    @principal = (params.fetch("principal_user")).to_f 
  
  
    @formatted_apr = @apr.to_fs(:percentage, { :precision => 4 })
  
    @formatted_principal = @principal.to_fs(:currency)
  
  
    @numerator = @apr * @principal 
  
    @denominator = 1 - (1 + @apr) ** -@years 
  
    @present_value = @numerator / @denominator 
  
    @formatted_present_value = @present_value.to_fs(:currency)
    
    render({ :template => "application_templates/payment_new"})
  end 


  ###Random Number 
  def random_new 
    @min = params[:min].to_f
    @max = params[:max].to_f
  
    @random_number = rand(@min..@max)

    render({ :template => "application_templates/random_new"})
  end 

end
