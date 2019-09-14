require 'rails_helper'
RSpec.describe 'Course Show Page', type: :feature do
    before :each do
      @regina = Student.create!(name: "Regina George")
      @napoleon = Student.create!(name: "Napoleon Dynamite")
      @peter = Student.create!(name: "Peter Parker")
      @history = Course.create!(name: "American History")
      @science = Course.create!(name: "Biology")
      @language = Course.create!(name: "French II")
      @history_grade_regina = CourseStudent.create!(course_id: @history.id, student_id: @regina.id, grade: 78.2899)
      @science_grade_regina = CourseStudent.create!(course_id: @science.id, student_id: @regina.id, grade: 98.00)
      @language_grade_regina = CourseStudent.create!(course_id: @language.id, student_id: @regina.id, grade: 27.8)
      @history_grade_napoleon = CourseStudent.create!(course_id: @history.id, student_id: @napoleon.id, grade: 66.345)
      @science_grade_napoleon = CourseStudent.create!(course_id: @science.id, student_id: @napoleon.id, grade: 23.80)
      @language_grade_napoleon = CourseStudent.create!(course_id: @language.id, student_id: @napoleon.id, grade: 99.87)
      @history_grade_peter = CourseStudent.create!(course_id: @history.id, student_id: @peter.id, grade: 100)
      @science_grade_peter = CourseStudent.create!(course_id: @science.id, student_id: @peter.id, grade: 50.78)
      @language_grade_peter = CourseStudent.create!(course_id: @language.id, student_id: @peter.id, grade: 60.39)
    end

    it "shows the course name and each student in the course from highest grade to lowest grade" do
      visit "/courses/#{@history.id}"
      expect(page).to have_content(@history.name)
      expect(page).to have_content("#{@peter.name}: #{@history_grade_peter.grade.round(2)}\n#{@regina.name}: #{@history_grade_regina.grade.round(2)}\n#{@napoleon.name}: #{@history_grade_napoleon.grade.round(2)}")
    end
end
