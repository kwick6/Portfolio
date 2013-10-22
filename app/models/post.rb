class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments
  scope :published, where(published: true)

  def publish!
    self.published = true
    save!
  end
end
