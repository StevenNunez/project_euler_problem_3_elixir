defmodule Prime do
  def is_prime?(2) do
    true
  end

  def is_prime?(num) do
    PrimeAgent.get(num) || do_is_prime(num)
  end

  defp do_is_prime(num) do
      valid_range(num)
      |> has_divisor?(num)
      |> flip_value
      |> cache(num)
  end

  defp flip_value(boolean) do
    !boolean
  end

  defp has_divisor?(collection, num) do
    Enum.any?(collection, &is_divisible_by?(num, &1))
  end

  defp cache(is_prime, num) do
    if is_prime do
      PrimeAgent.add(num)
    end
    is_prime
  end

  defp is_divisible_by?(numerator, denominator) do
    rem(numerator, denominator) == 0
  end

  defp valid_range(max) do
    2..max-1
  end
end
