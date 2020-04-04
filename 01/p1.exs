# The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

defmodule E do

  def sum_under(x) do
    ((x * x) + x) / 2
  end

  def sum_steps(step, limit) do
    step * sum_under(div(limit - 1, step))
  end

end

s = &E.sum_steps(&1, 1000)

IO.puts(s.(3) + s.(5) - s.(15))
# 233168.0
