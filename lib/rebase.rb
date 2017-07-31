module Rebase

  DEFAULT = [*0..9, *'a'..'z', *'A'..'Z'].join

  # convert decimal to `keys.length` cimal
  def self.encode(decimal_num, keys=DEFAULT)
    # special case
    return keys[0] if decimal_num == 0

    base = keys.length
    target = decimal_num
    res = []
    while(target > 0) do
      res.push(target % base)
      target = target / base
    end
    return res.map{|x|keys[x]}.reverse.join
  end

  # convert xcimal to decimal
  def self.decode(xcimal_str, keys=DEFAULT)
    base = keys.length
    return xcimal_str
      .chars
      .reverse
      .each_with_index
      .map{|v, index| keys.index(v) * (base ** index)}
      .reduce{|v, sum| sum = sum + v}
  end
end