class PathChangingService
  attr_reader :article

  def initialize(article)
    @article = article
  end
  # I mean, that this method is unimportant
  # def create_reference
   # article.reference = generate_reference
    # binding.pry
  # end

  def generate_reference
    begin
      random_number = rand(10_000_000)
      random_string = [*'A'..'Z'].sample(3).join
      reference = random_string + "-" + random_number.to_s
    # reference = 'RXA-2754054' it's for testing loop without over :)
    end while Article.exists?(reference: reference)

    article.reference = reference
    binding.pry
  end

end