require 'rails_helper'

describe CourseStudent, type: :model do
  describe "validations" do
    it { should validate_presence_of :grade }
    it { should validate_presence_of :student_id }
    it { should validate_presence_of :course_id }
  end

  describe "relationships" do
    it {should belong_to :course}
    it {should belong_to :student}
  end
end
