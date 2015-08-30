defmodule Problem_3Test do
  use ExUnit.Case

  test "knows that 2 is prime" do
    assert Prime.is_prime?(2)
  end

  test "knows that 4 is not prime" do
    refute Prime.is_prime?(4)
  end

  test "knows that 5 is prime" do
    assert Prime.is_prime?(5)
  end

  test "knows that 11 is prime" do
    assert Prime.is_prime?(11)
  end

  test "knows that 27 is not prime" do
    refute Prime.is_prime?(27)
  end

  test "knows that 1031 is prime" do
    assert Prime.is_prime?(1031)
  end

  test "knows 11 has no factors" do
    assert Factor.for(11) == []
  end

  test "knows factors for 15" do
    assert Factor.for(15) == [[3,5]]
  end

  test "knows factors for 30" do
    assert Factor.for(30) == [[2, 15], [3, 10], [5, 6]]
  end

  test "knows the factors for 13195" do
    assert Factor.for(13195) == [[5, 2639], [7, 1885], [13, 1015], [29, 455],
            [35, 377], [65, 203], [91, 145]]
  end

  test "knows the prime factors for a 13195" do
    assert Factor.prime_for(13195) == [5, 7, 13, 29]
  end

  test "knows the prime factors for a 600851475143" do
    assert Factor.prime_for(600851475143) == [71, 839, 1471, 6857]
  end

  test "knows the max prime factor of 600851475143" do
    assert Factor.max_prime(600851475143) == 6857
  end
end
