class PageController < ApplicationController
  def about
  end

  def articles
  end

  def blog
  end

  def calendar
   @time = Time.now
   @month = params['month'].to_i
   @year = params['year'].to_i
    if(!(@month >= 1 && @month <= 12)) #if !(1..12).include? @month
      @month = @time.strftime( '%m' ).to_i
    end
   if @year <= 0
     @year = @time.strftime( '%Y ').to_i
  end
end


  def preferences
  end

  def login
  end

    def contact
      @submitted = params['commit']
      @question = params["question"]
      @email = params["email"]

      if @email == ''
        flash.now['error'] = "* Please enter a valid email!"
        @form_error = true
      end

      @name = params["name"]
       if @name == ''
          flash.now['error'] = "* Please enter your name!"
          @form_error = true
       end

      @question = params['question']
      @new = params['new'] == 'new'
      @mailing_list = params['mailing_list'] == 'mailing_list'
      @contact = params['contact']
      @email1 = params['contact'] == "Email"
      @phone1 = params['contact'] == "Phone"
      @product = params['product']
      @phone = params['phone']
      end

    def home
    end

 def products
   #@products_hash = {
   #    'Snow Skiis' => '$200.00',
   #    'Snow Boards' => '$150.00',
   #    'Snow Boots' => '$100.00',
   #    'Mittens' => '$9.00',
   #    'Gloves' => '$15.00',
   #    'Hats' => '$20.00'
   #}
 end

end