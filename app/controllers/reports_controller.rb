class ReportsController < ApplicationController
    
    def index
       
    end

    def performance_pdf

        @student_filter=StudentPerformance.new #this variable for using with form_for for searching       
        performance_query
    end

    def show
        @student_performance=performance_query
        respond_to do |format|
            format.html
            format.pdf do
                pdf=Prawn::Document.new
                #pdf.text "Hello world"
                pdf=PerformancePdf.new(@student_performance)
                send_data pdf.render, 
                filename:"performance_.pdf",
                type: 'application/pdf',
                disposition: 'inline'

                #filename: "export.pdf",
                #type: 'application/pdf',
                #disposition: 'inline'
            end
        end

        

    end


    def performance_query

              
                #for fix error first time loading
                 if params[:student_performance].present?
                     @school_year = params[:student_performance][:school_year]
                     @school_id = params[:student_performance][:school_id]
                     @grade = params[:student_performance][:grade]
                     @student_name =params[:student_performance][:student_name]
                     @caption_button_report="ReportPerformancePDF" # for hight on menu when click on search
                     @student_performance=StudentPerformance.joins(:student).order(:id)
                 else
                     @student_performance=StudentPerformance.order(:id) # first time load
                 end
                
                 @student_performance=@student_performance.where(school_year: @school_year) if @school_year.present?
                 @student_performance=@student_performance.where(school_id: @school_id) if @school_id.present?
                 @student_performance=@student_performance.where(grade: @grade) if @grade.present?
                 @student_performance=@student_performance.where("student_name like ?", "%#{@student_name}%") if @student_name.present?
      
                 @student_performance
    end





    def performance_graph

        @student_filter=StudentPerformance.new #this variable for using with form_for for searching       
        
                #for fix error first time loading
                 if params[:student_performance].present?
                     @school_year = params[:student_performance][:school_year]
                     @school_id = params[:student_performance][:school_id]
                     @grade = params[:student_performance][:grade]
                     @student_name =params[:student_performance][:student_name]
                     @caption_button_report="ReportPerformanceGraph" # for hight on menu when click on search
                     @student_performance=StudentPerformance.joins(:student).order(:id)
                 else
                     @student_performance=StudentPerformance.order(:id) # first time load
                 end
                
                 @student_performance=@student_performance.where(school_year: @school_year) if @school_year.present?
                 @student_performance=@student_performance.where(school_id: @school_id) if @school_id.present?
                 @student_performance=@student_performance.where(grade: @grade) if @grade.present?
                 @student_performance=@student_performance.where("student_name like ?", "%#{@student_name}%") if @student_name.present?
        
        
    end



    

end
