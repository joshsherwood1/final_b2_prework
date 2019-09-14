class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
  end

  private
  def courses_params
    params.permit(:name)
  end
end
