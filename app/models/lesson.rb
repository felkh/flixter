class Lesson < ApplicationRecord
  mount_uploader :video, VideoUploader
  belongs_to :section
  
end
