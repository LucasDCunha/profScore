class PublicController < ApplicationController

    def home
        @teachers = Teacher.all.sort_by { |obj| [-obj.overallGrade, obj.name] }.take(6)
    end
end
