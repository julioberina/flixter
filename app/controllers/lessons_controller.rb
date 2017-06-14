class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_for_lesson_viewing, only: [:show]

  def show
  end

  private

  def require_enrolled_for_lesson_viewing
    unless current_user.enrolled_in? current_lesson.section.course
      redirect_to course_path(current_lesson.section.course), alert: 'You must be enrolled in the course to view lesson'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
