class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :reference

  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: {minimum: 5}
  before_save :generate_ref

  def generate_ref
    ::PathChangingService.generate_reference(self)
  end

  # def to_param
  #  "#{reference}".parameterize
  # end
end


