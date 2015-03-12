class PathChangingService
  attr_reader :object, :model_reference

  class << self
    def generate_reference(object_with_reference)
      new(object_with_reference).set_reference
      binding.pry
      #@article
    end

    private :new
  end

  def initialize(object)
    @object = object
    @model_reference = @object.class
    binding.pry
  end

  def create_reference
    [*'A'..'Z'].sample(3).join + "-" + rand(10_000_000).to_s
  end

  def set_reference
    loop {
      a = create_reference
      unless @model_reference.exists?(reference: a)
        object.reference = a
        break
      end
    }

    # randomize = randomizing_reference
    #article.reference = (@@reference)
    # artic.reference = randomizing_reference while
    binding.pry
   end

  # def randomizing_reference
  #   begin
  #   @reference = [*'A'..'Z'].sample(3).join + "-" + rand(10_000_000).to_s while Article.exists?(reference: @reference)
  #   end
end


  # I mean, that this method is unimportant
  # def create_reference
   # article.reference = generate_reference
    # binding.pry
  # end

   # def generate_referance
    # begin
      # reference = [*'A'..'Z'].sample(3).join + "-" + rand(10_000_000).to_s
    # reference = 'RXA-2754054' it's for testing loop without over :)
    # end while Article.exists?(reference: reference)
     # binding.pry
    # end


# end
