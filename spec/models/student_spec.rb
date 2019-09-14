require 'rails_helper'

describe Student, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it {should have_many :course_students}
    it {should have_many(:courses).through(:course_students)}
  end

  describe 'instance methods' do
    it "should show grade for a couse that the student is taking" do
      @regina = Student.create!(name: "Regina George")
      @history = Course.create!(name: "American History")
      @history_grade = CourseStudent.create!(course_id: @history.id, student_id: @regina.id, grade: 78.2899)
      expect(@regina.find_grade_by_course(@history.id).round(2)).to eq(78.29)
    end
  end
end
