class Course <ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students

  validates_presence_of :name

  def sort_students_by_grade
    self.course_students.order("grade DESC")
  end
end
