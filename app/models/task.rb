class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assigned_to, class_name: 'User'

  validates :title, presence: true

  enum status: {
    status_new: 'new',
    status_started: 'started',
    status_finished: 'finished'
  }
end
