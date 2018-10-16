class Client
  def initialize(name, time)
    @name=name
    @time=time
  end
  def getTime
    @time
  end
  def to_s
    " "+@name+" "
  end
end
