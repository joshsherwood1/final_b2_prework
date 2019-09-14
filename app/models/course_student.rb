class CourseStudent <ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates_presence_of :grade, :student_id, :course_id
end
