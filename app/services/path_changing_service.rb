class PathChangingService
  attr_reader :article, :reference
  @@reference = 0
  # attr_accessor :reference

  class << self
    def generate_reference(article)
      new(article).set_reference
      binding.pry
      @article
    end

    private :new


      # @article.reference = reference
      # reference = 'RXA-2754054' it's for testing loop without over :)
    end

  def initialize(article)
    @article = article
  end

  def randomizing_reference
    reference = [*'A'..'Z'].sample(3).join + "-" + rand(10_000_000).to_s while Article.exists?(reference: reference)
    # @@reference = reference
    @reference = reference
  end

  def set_reference

    # randomize = randomizing_reference
    #article.reference = (@@reference)
    article.reference = randomizing_reference
    binding.pry
  end


end

  # def randomizing_reference
  #   begin
  #   @reference = [*'A'..'Z'].sample(3).join + "-" + rand(10_000_000).to_s while Article.exists?(reference: @reference)
  #   end
  # end


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
