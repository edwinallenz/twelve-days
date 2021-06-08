defmodule TwelveDays do
  @table %{
    1 => [verse: "a Partridge in a Pear Tree", ordinal: "first"],
    2 => [verse: "two Turtle Doves", ordinal: "second"],
    3 => [verse: "three French Hens", ordinal: "third"],
    4 => [verse: "four Calling Birds", ordinal: "fourth"],
    5 => [verse: "five Gold Rings", ordinal: "fifth"],
    6 => [verse: "six Geese-a-Laying", ordinal: "sixth"],
    7 => [verse: "seven Swans-a-Swimming", ordinal: "seventh"],
    8 => [verse: "eight Maids-a-Milking", ordinal: "eighth"],
    9 => [verse: "nine Ladies Dancing", ordinal: "ninth"],
    10 => [verse: "ten Lords-a-Leaping", ordinal: "tenth"],
    11 => [verse: "eleven Pipers Piping", ordinal: "eleventh"],
    12 => [verse: "twelve Drummers Drumming", ordinal: "twelfth"]
  }

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    [verse: _, ordinal: ordinal] = @table |> Map.get(number)

    case number do
      1 ->
        "On the #{ordinal} day of Christmas my true love gave to me: #{
          Enum.reduce(1..number, "", fn x, acc ->
            [verse: verse, ordinal: _] = @table |> Map.get(x)
            verse <> acc
          end)
        }."

      _ ->
        "On the #{ordinal} day of Christmas my true love gave to me: #{
          Enum.reduce(1..number, "", fn x, acc ->
            [verse: verse, ordinal: _] = @table |> Map.get(x)
            put_verse(verse, x, acc)
          end)
        }."
    end
  end

  def put_verse(verse, index, acc) do
    case index do
      1 -> "and " <> verse <> acc
      _ -> verse <> ", " <> acc
    end
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.map(starting_verse..ending_verse, fn x -> verse(x) end)
    |> convert_to_string() |> String.trim()
  end

  defp convert_to_string([]) do
    ""
  end

  defp convert_to_string([h | t]) do
    h <> "\n" <> convert_to_string(t)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
