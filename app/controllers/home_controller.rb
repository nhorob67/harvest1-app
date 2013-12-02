class HomeController < ApplicationController
  respond_to :html, :xml, :js,:json
 
  protect_from_forgery :except => [:recommend_search]
  def remove_crop
   
    @crop=CropInformation.find(params[:id])
    @crop.destroy
      
    @attribute_fert_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"1")
    if @attribute_fert_cost.nil?
      @attribute_fert=ExpenseLabel.find(1)
    end  
    @attribute_seed_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"2")
    if @attribute_seed_cost.nil?
      @attribute_seed=ExpenseLabel.find(2)
    end
    @attribute_chem_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"3")
    if @attribute_chem_cost.nil?
      @attribute_chem=ExpenseLabel.find(3)
    end   
    @attribute_insurance_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"4")
    if @attribute_insurance_cost.nil?
      @attribute_insurance=ExpenseLabel.find(4)
    end
    @attribute_fuel_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"5")
    if @attribute_fuel_cost.nil?
      @attribute_fuel=ExpenseLabel.find(5)
    end
    @attribute_land_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"6")
    if @attribute_land_cost.nil?
      @attribute_cost=ExpenseLabel.find(6)
    end 
    @attribute_head_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"7")
    if @attribute_head_cost.nil?
      @attribute_head=ExpenseLabel.find(7)
    end  
    @attribute_family_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"8")
    if @attribute_family_cost.nil?
      @attribute_family=ExpenseLabel.find(8)
    end  

      @crop_label=CropInformationExpense.new
      @archive_year=ArchiveYear.find_all_by_user_id(current_user.id).collect(&:year)
      if params[:note]!="farmer"
        @year=Year.all
        @crop_info = CropInformation.find(:all, :conditions=> ["year = ? AND user_id = ?", "#{params[:data]}", "#{params[:user_id]}"] )
      if @crop_info.blank?
        @crop_info = CropInformation.find(:all, :conditions=> ["year = ?", "#{params[:data]}"] )
      end  
      else

        @years=Year.all
        @archive_year=ArchiveYear.find_all_by_user_id(params[:selected_user_id]).collect(&:year)
        @unarchive_year=[]
         @crop_info = CropInformation.find(:all, :conditions=> ["year = ? AND user_id = ?", "#{params[:data]}", "#{params[:selected_user_id]}"] )
        @years.each do |year|
          if !(@archive_year.include? year.year)
            @unarchive_year=@unarchive_year+Array(year)
          end
        end
      end
        @total_acre=0
        @crop_info.collect(&:acre).each do |acre|
          @total_acre=@total_acre+acre.to_i
        end
        @total_per_acre_avenue=0
        @avenvue=0
        @crop_info.each do |crop|
          if !crop.yield.blank? && !crop.projected_price.blank?
            @avenvue=crop.yield.to_i*crop.projected_price.to_i
            @total_per_acre_avenue=@avenvue+@total_per_acre_avenue
          end
          
        end
         @total_fertilizer=0
        @fertilizer=0
         @total_seed=0
        @seed=0
         @total_chemical=0
        @chemical=0
        @total_insurance=0
        @insurance=0
         @total_fuel=0
        @fuel=0
        @land_cost=0
        @total_land_cost=0
         @overhead=0
        @total_overhead=0
        @family_living=0
        @total_family_living=0
        @expenses=0
         @totalExpenses=0
         @total_weight=0
         @weight=0
        @crop_info.each do |crop|  
              if !crop.acre.blank?
            @fertilizer=crop.acre.to_i*crop.fertilizer.to_i
            @total_fertilizer=@fertilizer+@total_fertilizer 

            @seed=crop.acre.to_i*crop.seed.to_i
            @total_seed=@seed+@total_seed 
            
            @chemical=crop.acre.to_i*crop.chemical.to_i
            @total_chemical=@chemical+@total_chemical 

             @insurance=crop.acre.to_i*crop.insurance.to_i
            @total_insurance=@total_insurance+@insurance

             @fuel=crop.acre.to_i*crop.fuel.to_i
            @total_fuel=@total_fuel+@fuel  

             @land_cost=crop.acre.to_i*crop.land_cost.to_i
            @total_land_cost=@total_land_cost+@land_cost  

            @overhead=crop.acre.to_i*crop.overhead.to_i
            @total_overhead=@total_overhead+@overhead  

             @family_living=crop.acre.to_i*crop.family_living.to_i
            @total_family_living=@total_family_living+@family_living 
           
            if !crop.total_expenses.blank?
              @expenses =crop.acre.to_i*crop.total_expenses
              @totalExpenses=@totalExpenses+@expenses
            end 
            if !crop.yield.blank? && !crop.total_expenses.blank?
              @weight=((crop.projected_price.to_i*crop.yield.to_i)-crop.total_expenses)
            end  
            @total_weight=@total_weight+ @weight
        end
         end  
       
      
        respond_to do |format|
           format.js
        end
      
  end 
  def index
    
    @year=Year.all
    @recommends=Recommend.find(:all , :conditions => ["user_id!=?",1] )
    @counts=@recommends.count
    @crop_information=CropInformation.all
    if !current_user.nil?
      @archive_year=ArchiveYear.find_all_by_user_id(current_user.id).collect(&:year)
       @crop_information=CropInformation.find(:all, :conditions => ["user_id=?", current_user.id] )
     
      @recommend=Recommend.find(:all, :conditions => ["recommended_id=? OR user_id=?",current_user.id,1 ] )
      @count=@recommend.count
    end
  end

  def sign_in
  end

  def add_consultant
  	@user=User.new
  end

  def user_destroy
    
       
      
    @user=User.find(params[:id])
    @user.destroy
    

    @crop=CropInformation.find_by_user_id(params[:id])
    if !@crop.nil?
          @crop.destroy
    end      
     @recommend=Recommend.find_by_recommended_id(params[:id])
    if  !@recommend.nil?  
     @recommend.destroy
    end  

    @users=User.all

    respond_to do |format|                

       format.js
     end
  
  end
  def consultant_create
    params[:user][:orignal_password]=params[:user][:password]
    if !((params[:user]["email"].blank?) || (params[:user]["password"].blank?))
      @user=User.create(params[:user])
      if current_user.has_role? :consultant
        @user.add_role "user"
      else
        @user.add_role "consultant"
      end

      @user.consultant_id = current_user.id
      if @user.save
          redirect_to recommend_home_index_path 
      end
    else
      flash[:notice] = 'Email and Password cannot blank.'
      redirect_to recommend_home_index_path
    end
  end

  def add_user
  	@user=User.new
  end

  def create_crop_information
    @crop=CropInformation.new
  end
def update_label
  if !params[:data][:label_id].nil?
    @attribute_land_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,params[:data][:label_id])
    @attribute_land_cost.update_attributes(:label_name=>params[:crop_information_label][:label_name],:label_value=>params[:data][:label_id],:user_id=>current_user.id,:year=> params[:data][:year])
    respond_to do |format|
      format.json { respond_with_bip(@attribute_land_cost) }
      format.js
    end  
  else
    @attribute= CropInformationLabel.create(:label_name=>params[:expense_label][:name],:label_value=>params[:id],:user_id=>current_user.id,:year=>params[:data][:year])
    @attribute.save
    respond_to do |format|    
    format.json { head :no_content }
    format.js
  end
 end 
 
end
  def crop
    
  @attribute_fert_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"1")
  if @attribute_fert_cost.nil?
    @attribute_fert=ExpenseLabel.find(1)
  end  
  @attribute_seed_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"2")
  if @attribute_seed_cost.nil?
    @attribute_seed=ExpenseLabel.find(2)
  end
  @attribute_chem_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"3")
  if @attribute_chem_cost.nil?
    @attribute_chem=ExpenseLabel.find(3)
  end   
  @attribute_insurance_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"4")
  if @attribute_insurance_cost.nil?
    @attribute_insurance=ExpenseLabel.find(4)
  end
  @attribute_fuel_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"5")
  if @attribute_fuel_cost.nil?
    @attribute_fuel=ExpenseLabel.find(5)
  end
  @attribute_land_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"6")
  if @attribute_land_cost.nil?
    @attribute_cost=ExpenseLabel.find(6)
  end 
  @attribute_head_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"7")
  if @attribute_head_cost.nil?
    @attribute_head=ExpenseLabel.find(7)
  end  
  @attribute_family_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"8")
  if @attribute_family_cost.nil?
    @attribute_family=ExpenseLabel.find(8)
  end  

    @crop_label=CropInformationExpense.new
    @archive_year=ArchiveYear.find_all_by_user_id(current_user.id).collect(&:year)
    if params[:note]!="farmer"
      @year=Year.all
      @crop_info = CropInformation.find(:all, :conditions=> ["year = ? AND user_id = ?", "#{params[:data]}", "#{params[:user_id]}"] )
    if @crop_info.blank?
      @crop_info = CropInformation.find(:all, :conditions=> ["year = ?", "#{params[:data]}"] )
    end  
    else

      @years=Year.all
      @archive_year=ArchiveYear.find_all_by_user_id(params[:selected_user_id]).collect(&:year)
      @unarchive_year=[]
       @crop_info = CropInformation.find(:all, :conditions=> ["year = ? AND user_id = ?", "#{params[:data]}", "#{params[:selected_user_id]}"] )
      @years.each do |year|
        if !(@archive_year.include? year.year)
          @unarchive_year=@unarchive_year+Array(year)
        end
      end
    end
      @total_acre=0
      @crop_info.collect(&:acre).each do |acre|
        @total_acre=@total_acre+acre.to_i
      end
      @total_per_acre_avenue=0
      @avenvue=0
      @crop_info.each do |crop|
        if !crop.yield.blank? && !crop.projected_price.blank?
          @avenvue=crop.yield.to_i*crop.projected_price.to_i
          @total_per_acre_avenue=@avenvue+@total_per_acre_avenue
        end
        
      end
       @total_fertilizer=0
      @fertilizer=0
       @total_seed=0
      @seed=0
       @total_chemical=0
      @chemical=0
      @total_insurance=0
      @insurance=0
       @total_fuel=0
      @fuel=0
      @land_cost=0
      @total_land_cost=0
       @overhead=0
      @total_overhead=0
      @family_living=0
      @total_family_living=0
      @expenses=0
       @totalExpenses=0
       @total_weight=0
       @weight=0
      @crop_info.each do |crop|  
            if !crop.acre.blank?
          @fertilizer=crop.acre.to_i*crop.fertilizer.to_i
          @total_fertilizer=@fertilizer+@total_fertilizer 

          @seed=crop.acre.to_i*crop.seed.to_i
          @total_seed=@seed+@total_seed 
          
          @chemical=crop.acre.to_i*crop.chemical.to_i
          @total_chemical=@chemical+@total_chemical 

           @insurance=crop.acre.to_i*crop.insurance.to_i
          @total_insurance=@total_insurance+@insurance

           @fuel=crop.acre.to_i*crop.fuel.to_i
          @total_fuel=@total_fuel+@fuel  

           @land_cost=crop.acre.to_i*crop.land_cost.to_i
          @total_land_cost=@total_land_cost+@land_cost  

          @overhead=crop.acre.to_i*crop.overhead.to_i
          @total_overhead=@total_overhead+@overhead  

           @family_living=crop.acre.to_i*crop.family_living.to_i
          @total_family_living=@total_family_living+@family_living 
         
          if !crop.total_expenses.blank?
            @expenses =crop.acre.to_i*crop.total_expenses
            @totalExpenses=@totalExpenses+@expenses
          end 
          if !crop.yield.blank? && !crop.total_expenses.blank?
            @weight=((crop.projected_price.to_i*crop.yield.to_i)-crop.total_expenses)
          end  
          @total_weight=@total_weight+ @weight
      end
       end  
     
    
      respond_to do |format|
         format.js
      end
  end

  def sale
     #@crop=CropInformation.find(:all , :conditions => ["user_id=?", current_user.id] ).collect(&:crop_name).uniq
    @crop=CropInformation.find(:all , :conditions => ["user_id=?", current_user.id] )
    @archive_year=ArchiveYear.find_all_by_user_id(current_user.id).collect(&:year)
    @year=Year.all
    
   
          
    
     respond_to do |format|
         format.js
      end
  end
 

  def update_crop_information
  
    params[:crop].each do|crop| 
      crop[:production]=(crop[:acre].to_i)*(crop[:yield].to_i)
     crop[:total_expenses]=(crop[:fertilizer].to_i)+(crop[:seed].to_i)+(crop[:chemical].to_i)+(crop[:insurance].to_i)+(crop[:fuel].to_i)+(crop[:land_cost].to_i)+( crop[:overhead].to_i)+(crop[:family_living].to_i)
     
     if !(crop[:id]).blank?
        @crop_information=CropInformation.find(crop[:id]).update_attributes(crop)
     end 

    end
     @attribute_fert_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"1")
  if @attribute_fert_cost.nil?
    @attribute_fert=ExpenseLabel.find(1)
  end  
  @attribute_seed_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"2")
  if @attribute_seed_cost.nil?
    @attribute_seed=ExpenseLabel.find(2)
  end
  @attribute_chem_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"3")
  if @attribute_chem_cost.nil?
    @attribute_chem=ExpenseLabel.find(3)
  end   
  @attribute_insurance_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"4")
  if @attribute_insurance_cost.nil?
    @attribute_insurance=ExpenseLabel.find(4)
  end
  @attribute_fuel_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"5")
  if @attribute_fuel_cost.nil?
    @attribute_fuel=ExpenseLabel.find(5)
  end
  @attribute_land_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"6")
  if @attribute_land_cost.nil?
    @attribute_cost=ExpenseLabel.find(6)
  end 
  @attribute_head_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"7")
  if @attribute_head_cost.nil?
    @attribute_head=ExpenseLabel.find(7)
  end  
  @attribute_family_cost=CropInformationLabel.find_by_user_id_and_label_value(current_user.id,"8")
  if @attribute_family_cost.nil?
    @attribute_family=ExpenseLabel.find(8)
  end  

    @crop_label=CropInformationExpense.new

      @crop_info = CropInformation.find(:all, :conditions=> ["year = ?", "#{CropInformation.find(params[:crop][0][:id]).year}"] )

      @years=Year.all
      @archive_year=ArchiveYear.find_all_by_user_id(params[:selected_user_id]).collect(&:year)
      @unarchive_year=[]
      
      @years.each do |year|
        if !(@archive_year.include? year.year)
          @unarchive_year=@unarchive_year+Array(year)
        end
      end
    
      @total_acre=0
      @crop_info.collect(&:acre).each do |acre|
        @total_acre=@total_acre+acre.to_i
      end
      @total_per_acre_avenue=0
      @avenvue=0
      @crop_info.each do |crop|
        if !crop.yield.blank? && !crop.projected_price.blank?
          @avenvue=crop.yield.to_i*crop.projected_price.to_i
          @total_per_acre_avenue=@avenvue+@total_per_acre_avenue
        end
        
      end
       @total_fertilizer=0
      @fertilizer=0
       @total_seed=0
      @seed=0
       @total_chemical=0
      @chemical=0
      @total_insurance=0
      @insurance=0
       @total_fuel=0
      @fuel=0
      @land_cost=0
      @total_land_cost=0
       @overhead=0
      @total_overhead=0
      @family_living=0
      @total_family_living=0
      @expenses=0
       @totalExpenses=0
       @total_weight=0
       @weight=0
      @crop_info.each do |crop|  
            if !crop.acre.blank?
          @fertilizer=crop.acre.to_i*crop.fertilizer.to_i
          @total_fertilizer=@fertilizer+@total_fertilizer 

          @seed=crop.acre.to_i*crop.seed.to_i
          @total_seed=@seed+@total_seed 
          
          @chemical=crop.acre.to_i*crop.chemical.to_i
          @total_chemical=@chemical+@total_chemical 

           @insurance=crop.acre.to_i*crop.insurance.to_i
          @total_insurance=@total_insurance+@insurance

           @fuel=crop.acre.to_i*crop.fuel.to_i
          @total_fuel=@total_fuel+@fuel  

           @land_cost=crop.acre.to_i*crop.land_cost.to_i
          @total_land_cost=@total_land_cost+@land_cost  

          @overhead=crop.acre.to_i*crop.overhead.to_i
          @total_overhead=@total_overhead+@overhead  

           @family_living=crop.acre.to_i*crop.family_living.to_i
          @total_family_living=@total_family_living+@family_living 
         
          if !crop.total_expenses.blank?
            @expenses =crop.acre.to_i*crop.total_expenses
            @totalExpenses=@totalExpenses+@expenses
          end 
          if !crop.yield.blank? && !crop.total_expenses.blank?
            @weight=((crop.projected_price.to_i*crop.yield.to_i)-crop.total_expenses)
          end  
          @total_weight=@total_weight+ @weight
      end
       end  
    flash[:notice] = 'Crop Information updated.'
        respond_to do |format|
       format.js
    end
  end
  def crop_information
    params[:crop][:user_id]=current_user.id

    if (current_user.crop_informations.collect{ |p| p.crop_name}.include? params[:crop][:crop_name])

      if (current_user.crop_informations.collect{ |p| p.year}.include? params[:crop][:year])
          flash[:notice] = 'Crop Information Already Stored.'

      else  
      params[:crop][:total_expenses]=(params[:crop][:fertilizer].to_i)+(params[:crop][:seed].to_i)+(params[:crop][:chemical].to_i)+(params[:crop][:insurance].to_i)+(params[:crop][:fuel].to_i)+(params[:crop][:land_cost].to_i)+( params[:crop][:overhead].to_i)+(params[:crop][:family_living].to_i)

        @crop =CropInformation.create(params[:crop])
        if @crop.save
          flash[:notice] = 'Crop Information Saved.'
         
        end
      end
    else  
       @crop =CropInformation.create(params[:crop])
        if @crop.save
          flash[:notice] = 'Crop Information Saved.'
         
        end
    end    
    
    redirect_to root_path
  end
  def crop_expense
     @expense=CropInformationExpense.create(params[:crop_expense])
     @expense.user_id=current_user.id
    @expense.save
    respond_to do |format|
       format.js
    end
  end

  def create_crop_sale
    params[:sales][:user_id]=current_user.id
    Sale.create(params[:sales])
    flash[:notice] = 'Crop Sale information saved.'
    redirect_to users_crop_sales_home_index_path
  end

  def users_crop_sales
    
  end

  def hedge_sale

      @crop=CropInformation.find(:all , :conditions => ["user_id=?", current_user.id] )

      @archive_year=ArchiveYear.find_all_by_user_id(current_user.id).collect(&:year)
      @years=Year.all
      @unarchive_year=[]
      @years.each do |year|
        if !(@archive_year.include? year.year)
          @unarchive_year=@unarchive_year+Array(year)
        end
      end
    @date = Date.today
    @months = []
    @years=[]
    (0..11).each do |m|
     @months << [@date.next_month(m).strftime("%b"), @date.next_month(m)]
    end
    respond_to do |format|
       format.js
    end
  end

  def hedge_sale_create
    if params[:id]=="cash"
      
     @cash_sale=CashSale.create(:open_order=>params[:open_order],:bushels=>params[:bushels],:delivery_location=>params[:delivery_location],:futures_price=>params[:futures_price],:basic=>params[:basic],:contact_number=>params[:contact_number],:cash_price=>(params[:futures_price].to_i+params[:basic].to_i),:percentage_production=>params[:percentage_production],:year=>params[:year],:user_id=>params[:user_id],:crop_name=>params[:crop_name])
    end
     if params[:id]=="forward"
     @cash_sale=ForwardContract.create(:open_order=>params[:open_order],:bushels=>params[:bushels],:delivery_location=>params[:delivery_location],:delivery_period=>params[:delivery_period],:futures_price=>params[:futures_price],:basic=>params[:basic],:contact_number=>params[:contact_number],:cash_price=> (params[:futures_price].to_i+params[:basic].to_i),:percentage_production=>params[:percentage_production],:year=>params[:year] ,:user_id=>params[:user_id],:crop_name=>params[:crop_name])
    end
     if params[:id]=="hedge"
     @cash_sale=HedgeToArrive.create(:open_order=>params[:open_order],:bushels=>params[:bushels],:delivery_location=>params[:delivery_location],:future_month=>(params[:date][:month]+"-"+params[:date][:year]),:futures_price=>params[:futures_price],:basic=>params[:basic],:contact_number=>params[:contact_number],:cash_price=>(params[:futures_price].to_i+params[:basic].to_i),:percentage_production=>params[:percentage_production],:year=>params[:year] ,:user_id=>params[:user_id],:crop_name=>params[:crop_name])
    end
     if params[:id]=="basis"
     @cash_sale=BasicContract.create(:open_order=>params[:open_order],:bushels=>params[:bushels],:delivery_location=>params[:delivery_location],:future_month=>(params[:date][:month]+"-"+params[:date][:year]),:futures_price=>params[:futures_price],:basic=>params[:basic],:contact_number=>params[:contact_number],:cash_price=>(params[:futures_price].to_i+params[:basic].to_i),:percentage_production=>params[:percentage_production],:year=>params[:year] ,:user_id=>params[:user_id],:crop_name=>params[:crop_name])
    end
     if params[:id]=="future"

     @cash_sale=Future.create(:open_order=>params[:open_order],:long_short=>params[:long_short],:contract=>params[:contract],:future_month=>(params[:date][:month]+"-"+params[:date][:year]),:futures_price=>params[:futures_price],:gain_loss=>params[:gain_loss],:year=>params[:year] ,:user_id=>params[:user_id],:crop_name=>params[:crop_name])
    end
     if params[:id]=="option"
     @cash_sale=Option.create(:open_order=>params[:open_order],:long_short=>params[:long_short],:contract=>params[:contract],:put_call=>params[:put_call],:strike_price=>params[:strike_price],:premium=>params[:premium],:gain_loss=>params[:gain_loss],:year=>params[:year] ,:user_id=>params[:user_id],:crop_name=>params[:crop_name])
    end
    if current_user.has_role? :consultant
     redirect_to recommend_home_index_path
    else
     redirect_to root_path
    end
  end

  def user_create
  	
   	@user=User.create(params[:user])
  	@user.add_role "user"
    @user.consultant_id = current_user.id
  	if @user.save
      redirect_to root_path  
    end
  end

  def recommend
    @unarchive_years=[]
    @year=Year.all
    @year.each do |year|
     if year.archive !=true
      @unarchive_years << year
     end
    end  
    @user=[]
    @farmer=[]
    @recommend=Recommend.new
    @users=User.all
    
     @users.each do |user|
      if user.has_role? :user
        
          user=Array(user)
          @farmer=@farmer+user 
      end
      end
    @users.each do |user|
      if user.has_role? :user
        if user.consultant_id==current_user.id
          user=Array(user)
          @user=@user+user 
        end
      end 
      if current_user.has_role? :admin
        @recommend=Recommend.find(:all, :conditions => ["user_id=?", current_user.id] )
      end
    end
    @news=Recommend.find(:all, :conditions => ["user_id=?", current_user.id ])

    @consultant_users=User.find(:all, :conditions => ["consultant_id=?", current_user.id ])
  end

  def recommed_create
    if !current_user.has_role? :admin 
        @recommended_ids=params[:recommended_id]
        if !params[:recommend][:content].blank?
           @message=params[:recommend][:content].gsub!(/(<[^>]*>)|\n|\t/s) {" "}
            if !@recommended_ids.blank?
              @recommended_ids.each do |recom|
                
                if !User.find(recom).cell_number.blank?
                  if User.find(recom).cell_number[0]=="+"

                    @twilio_client = Twilio::REST::Client.new TWILIO_SID,TWILIO_TOKEN
                    @twilio_client.account.sms.messages.create({:from => '+12027602229', :to => User.find(recom).cell_number, :body => @message})
                  end            
                end  

                UserMailer.welcome_email(current_user.email, User.find(recom),@message).deliver
                params[:recommend][:recommended_id]=recom
                @recommend=Recommend.create(params[:recommend])  
                @recommend.user_id=current_user.id  
                @recommend.save
              end
            else
              
              @all_recomended=User.where(:consultant_id=>current_user.id)
              @all_recomended.each do |recom|
                @recomended_id=recom.id
                if !User.find(@recomended_id).cell_number.blank?
                  if User.find(@recomended_id).cell_number[0]=="+"
                    @twilio_client = Twilio::REST::Client.new TWILIO_SID,TWILIO_TOKEN
                    @twilio_client.account.sms.messages.create({:from => '+12027602229', :to => User.find(@recomended_id).cell_number, :body => @message})
                  end            
                end
                UserMailer.welcome_email(current_user.email, User.find(@recomended_id),@message).deliver
                params[:recommend][:recommended_id]=recom.id
                @recommend=Recommend.create(params[:recommend])  
                @recommend.user_id=current_user.id  
                @recommend.save
              end 
           end
        end  


      else
        @recommend=Recommend.create(params[:recommend])  
        @recommend.user_id=current_user.id  
        @recommend.recommended_id=params[:recommended_id]
        @recommend.save
      end 


    redirect_to recommend_home_index_path
  end
  def recommend_search

    @archive_year=ArchiveYear.find_all_by_user_id(params[:select_user_id]).collect(&:year)
    @years=Year.all
    @unarchive_year=[]
    @recommend=Recommend.find(:all, :conditions => ["recommended_id=?", params[:select_user_id].to_i] )
    @crop_information=CropInformation.find(:all, :conditions => ["user_id=?", params[:select_user_id].to_i] )
    @user_news=Recommend.find_all_by_recommended_id(params[:select_user_id])
    @count=@user_news.count
    respond_to do |format|
      format.js
    end
  end

  def consultant_user_list
    @user=User.find(:all, :conditions => ["consultant_id=?", current_user.id] )
  end

   # def consultant_list
   #   @user=User.find(:all, :conditions => ["consultant_id=?", current_user.id] )
   # end

  def users_list
    @user=User.all
  end

  def user_recommend
    @recommend=Recommend.find(:all, :conditions => ["recommended_id=?", current_user.id] )
  end

  def add_archive
    @archive_year=ArchiveYear.find_all_by_user_id(params[:select_user_id]).collect(&:year)
    @years=Year.all
    @unarchive_year=[]
    @years.each do |year|
    if !(@archive_year.include? year.year)
      
      @unarchive_year=@unarchive_year+Array(year)
    end
    
    end
   respond_to do |format|
      format.js
   end
  end

  def remove_archive
   @archive_year=Year.find(params[:format])
   @archive_year.archive=false
   if @archive_year.save
    redirect_to recommend_home_index_path
   end
  end
  def new_year
    
  end
  def year_create
    @year=Year.create(:year=>params[:year],:archive=>0)
    if @year.save
      flash[:notice] = 'Year saved.'
     
     
      CropInformation.create(crop_name: 'Corn',year:@year.year)
      CropInformation.create(crop_name: 'Soyabean',year:@year.year)
      CropInformation.create(crop_name: 'Wheat',year:@year.year)
     
     redirect_to recommend_home_index_path 
    else
      flash[:notice] = 'Year already created.'
      redirect_to recommend_home_index_path
    end
  end
 def archive_select
    
    @users=User.all
    @users.each do |user|
      user.has_role? :user
      ArchiveYear.create(user_id: user.id,year: params[:year],archive: true)
      
    end  
   @year=Year.find_by_year(params[:year].to_i)
   @year.archive=true
   @year.save
   redirect_to recommend_home_index_path
  end
end
