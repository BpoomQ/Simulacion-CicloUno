class Client
  def initialize
    @letters = ['a','b','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    @name = nextLetter
    @time = rand(4..25)
  end

  def nextLetter
    index=rand(0..24)
    @letters[index]
  end

  def getTime
    @time
  end
  
  def to_s
    "#{@name}"
  end
end
