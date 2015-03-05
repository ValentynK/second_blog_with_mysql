class FactoryMethodService

  def initialize(iproduct)
    @iproduct = iproduct
  end

  class ProductA
      @iproduct =  "from Spain"
  end
  bindig.pry

  class ProductB
    @iproduct =  "from South Africa"
  end

  class DefaultProduct
    @iproduct =  "not availible"
  end

  class Creator
    ProductA.new if month >= 4 && month <=11
    else
      ProductB.new if month == 1 || month == 2 || month ==12
      else
        DefaultProduct.new
  end
  c = Creator.new
  pu
end
