class ApplicationController < ActionController::Base
  def home 
    render({ :template => "application_templates/home"})
  end 


  ###Square
  def square_new
    render({ :template => "application_templates/square_new"})
  end 

  def square_new_results
    @the_num = params.fetch("user_number").to_f

    @the_result = @the_num ** 2
  
    render({ :template => "application_templates/square_new_result"})
  end 



  ###Square Root
  def square_root_new
    render({ :template => "application_templates/square_root_new"})
  end 
  
  def square_root_results
    @the_num = params.fetch("user_number").to_f

    @the_result = @the_num ** 0.5

    render({ :template => "application_templates/square_root_results"})
  end 


  ###Payment
  def payment_new
    render({ :template => "application_templates/payment_new"})
  end 
  
  def payment_new_results
    @apr = ((params.fetch("APR_user").to_f) / 100 / 12 )    
  
    @years = (params.fetch("years_user")).to_i * 12 
  
    @principal = (params.fetch("principal_user")).to_f 
  
    @formatted_apr = @apr.to_fs(:percentage, { :precision => 4 })
  
    @formatted_principal = @principal.to_fs(:currency)
  
    @numerator = @apr * @principal 
  
    @denominator = 1 - (1 + @apr) ** -@years 
  
    @present_value = @numerator / @denominator 
  
    @formatted_present_value = @present_value.to_fs(:currency)
    
    render({ :template => "application_templates/payment_new_results"})
  end 


  ###Random Number 
  def random_new 
    render({ :template => "application_templates/random_new"})
  end 
  
  def random_new_results 
    @min = params[:min].to_f
    @max = params[:max].to_f
  
    @random_number = rand(@min..@max)

    render({ :template => "application_templates/random_new_results"})
  end 

end
