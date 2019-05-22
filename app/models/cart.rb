class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def total_count
    @contents.values.sum
  end
end
