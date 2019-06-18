class PerformancePdf < Prawn::Document
    def initialize(student)
        super(top_margin: 70)
        @student=student
        #text "Student\##{@student.student_id}", size:30, style: :bold
        text "Student\performance", size:30, style: :bold
        line_items
    end

    def line_items
        move_down 20
        table line_item_rows
    end

    def line_item_rows
        i=0
       [["No.","School Year","Student Name","Grade","Avg1","Avg2","Total Avg"]]+      
        @student.map do |item|
            i=i+1
            total_scoreS1=item.math_s1+item.khmer_s1+item.social_s1
            avg_s1=total_scoreS1/3
            total_scoreS2=item.math_s2+item.khmer_s2+item.social_s2
            avg_s2=total_scoreS2/3
            avg=(total_scoreS1+total_scoreS2)/2
            
  
           [i,item.school_year,item.student.student_name,item.grade,avg_s1,avg_s2,avg]
        end

    end
end