defmodule Factor do
  def for(num) do
    if Prime.is_prime?(num) do
      []
    else
      num
      |> square_root
      |> valid_prime_factor_range
      |> derive_factors(num)
    end
  end

  defp derive_factors(collection, target) do
    collection
    |> Enum.filter_map(&evenly_divisible?(target, &1),
                        (&factor_from_divider(&1, target)))
  end

  defp evenly_divisible?(numerator, denominator) do
    rem(numerator, denominator) == 0
  end

  defp factor_from_divider(divider, num) do
    [divider, trunc(num/divider)]
  end

  defp square_root(num) do
    :math.sqrt(num) |> trunc
  end

  defp valid_prime_factor_range(max) do
    2..max
  end

  def prime_for(num) do
    Factor.for(num)
    |> List.flatten
    |> Enum.filter(&Prime.is_prime?(&1))
  end

  def max_prime(num) do
    prime_for(num) |> Enum.sort |> List.last
  end

  def max_primes(range) do
    range
    |> remove_primes
    |> Enum.map(&Task.async(fn ->
      [&1, max_prime(&1)]
    end))
    |> Enum.map(&Task.await(&1))
  end

  defp remove_primes(collection) do
    collection
    |> Enum.reject(&Prime.is_prime?(&1))
  end
end
