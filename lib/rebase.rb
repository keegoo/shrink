module Rebase

  CHARACTORS = [*0..9, *'a'..'z', *'A'..'Z'].join

  # convert decimal to `CHARACTORS.length` cimal
  def self.encode(decimal_num)
    # special case: 0
    return CHARACTORS[0] if decimal_num == 0

    base = CHARACTORS.length
    target = decimal_num
    res = []
    while(target > 0) do
      res.push(target % base)
      target = target / base
    end
    return res.map{|x|CHARACTORS[x]}.reverse.join
  end

  # convert xcimal to decimal
  def self.decode(xcimal_str)
    base = CHARACTORS.length
    return xcimal_str
      .chars
      .reverse
      .each_with_index
      .map{|v, index| CHARACTORS.index(v) * (base ** index)}
      .reduce{|v, sum| sum = sum + v}
  end
end