defmodule TwelveDays do

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """

  @static_verses %{
    1 =>   [verse: "Partridge in a Pear Tree.", ordinal: "a", cardinal: "first"]
  }
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    [verse: verse, ordinal: ordinal, cardinal: cardinal] = @static_verses[number]
    prepend(cardinal) <> post_sentence(number, ordinal)
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
  end

  defp prepend(ordinal), do: "On the #{ordinal} day of Christmas my true love gave to me:"
  defp post_sentence(index, cardinal) do
    %{
      1 =>   " #{cardinal} Partridge in a Pear Tree.",
      2 => " #{cardinal} Turtle Doves, and a Partridge in a Pear Tree."
    } |> Map.get(index)
  end
end
