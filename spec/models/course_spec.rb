require 'rails_helper'

describe Course, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it {should have_many :course_students}
    it {should have_many(:students).through(:course_students)}
  end

  describe "instance methods" do
    it "shows list of course_students in order" do
      @regina = Student.create!(name: "Regina George")
      @napoleon = Student.create!(name: "Napoleon Dynamite")
      @peter = Student.create!(name: "Peter Parker")
      @history = Course.create!(name: "American History")
      @history_grade_regina = CourseStudent.create!(course_id: @history.id, student_id: @regina.id, grade: 78.2899)
      @history_grade_napoleon = CourseStudent.create!(course_id: @history.id, student_id: @napoleon.id, grade: 66.345)
      @history_grade_peter = CourseStudent.create!(course_id: @history.id, student_id: @peter.id, grade: 100)
      expect(@history.sort_students_by_grade).to eq([@history_grade_peter, @history_grade_regina, @history_grade_napoleon])
    end
  end
end
