class Student <ApplicationRecord
  has_many :course_students
  has_many :courses, through: :course_students

  validates_presence_of :name

  def find_grade_by_course(course_id)
    self.course_students.find_by(course_id: course_id).grade
  end
end
