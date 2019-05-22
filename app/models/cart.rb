class Cart

  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def total_count
    @contents.values.sum
  end

  def add_song(id)
    @contents[id.to_s] = count_of(id) + 1
  end

  def count_of(id)
    @contents[id.to_s].to_i
  end
end
