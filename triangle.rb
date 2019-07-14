class Triangle
  attr_reader :sides, :kind

  def initialize(side_a, side_b, side_c)
    @sides = [side_a, side_b, side_c]
    @kind = default_kind
  end

  def speechified_kind
    unless kind.nil?
      "#{kind}ですね！"
    else
      "三角形じゃないです＞＜"
    end
  end

  private
  def default_kind
    if triangle?
      if same_size_of_all_sides?
        "正三角形"
      elsif same_size_of_2_sides?
        "二等辺三角形"
      else
        "不等辺三角形"
      end
    end
  end

  def same_size_of_all_sides?
    sides.uniq.count == 1 ? true : false
  end

  def same_size_of_2_sides?
    sides.uniq.count == 2 ? true : false
  end

  def triangle?
    sides.sum-biggest_side > biggest_side ? true : false
  end

  def biggest_side
    sides.max
  end
end

if __FILE__ == $0
  sides = ARGV[0].split(",").map(&:to_i)
  puts Triangle.new(sides[0],sides[1],sides[2]).speechified_kind
end
