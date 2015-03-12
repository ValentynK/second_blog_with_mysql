class Comment < ActiveRecord::Base
  belongs_to :article
  before_save :generate_ref

  def generate_ref
    ::PathChangingService.generate_reference(self)
  end
end
