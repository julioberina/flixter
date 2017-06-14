class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end
end
