module Api
    class CoursesController <  ApplicationController
        respond_to :json

        def index
            @courses = Course.all
        end

        def show
            render :show                
        end
        
    end    
end    