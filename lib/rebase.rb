module Rebase

  DEFAULT = [*0..9, *'a'..'z', *'A'..'Z'].join

  # convert decimal to `keys.length` cimal
  def encode(decimal_num, keys=DEFAULT)
    # check input
    raise "input should be a number" unless decimal_num.is_a? Numeric
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
  def decode(xcimal_str, keys=DEFAULT)
    # check input
    raise "input should be a string" unless xcimal_str.is_a? String
    base = keys.length
    return xcimal_str
      .chars
      .reverse
      .each_with_index
      .map{|v, index| keys.index(v) * (base ** index)}
      .reduce{|v, sum| sum = sum + v}
  end

  extend self
end