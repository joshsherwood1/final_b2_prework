require 'rails_helper'

RSpec.describe 'Student Show Page', type: :feature do
  describe 'When I go to a student show page' do
    before :each do
      @regina = Student.create!(name: "Regina George")
      @history = Course.create!(name: "American History")
      @science = Course.create!(name: "Biology")
      @language = Course.create!(name: "French II")
      @history_grade = CourseStudent.create!(course_id: @history.id, student_id: @regina.id, grade: 78.2899)
      @science_grade = CourseStudent.create!(course_id: @science.id, student_id: @regina.id, grade: 98.00)
      @language_grade = CourseStudent.create!(course_id: @language.id, student_id: @regina.id, grade: 27.8)
    end

    it 'I can see students name, name of each course they are enrolled in, and students grade for each course' do
      visit "/students/#{@regina.id}"

      expect(page).to have_content("#{@regina.name}")

      within "#course-#{@history.id}" do
        expect(page).to have_content("#{@history.name}")
        expect(page).to have_content("#{@history_grade.grade.round(2)}")
      end

      within "#course-#{@science.id}" do
        expect(page).to have_content("#{@science.name}")
        expect(page).to have_content("#{@science_grade.grade.round(2)}")
      end

      within "#course-#{@language.id}" do
        expect(page).to have_content("#{@language.name}")
        expect(page).to have_content("#{@language_grade.grade.round(2)}")
      end
    end
  end
end
