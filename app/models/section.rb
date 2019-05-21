class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons

  include RankedModel
  ranks :row_order, with_same: :course_id

  def next_lesson
    lesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first
    if lesson.blank? && section.next_section
      return section.next_section.lessons.rank(:row_order).first
    end
    return lesson
  end

end
