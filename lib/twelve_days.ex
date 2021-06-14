defmodule TwelveDays do
  @moduledoc "Build Twelve Days song"

  @table %{
    1 => [verse: "Partridge in a Pear Tree", cardinal: "a", ordinal: "first"],
    2 => [verse: "Turtle Doves", cardinal: "two", ordinal: "second"],
    3 => [verse: "French Hens", cardinal: "three", ordinal: "third"],
    4 => [verse: "Calling Birds", cardinal: "four", ordinal: "fourth"],
    5 => [verse: "Gold Rings", cardinal: "five", ordinal: "fifth"],
    6 => [verse: "Geese-a-Laying", cardinal: "six", ordinal: "sixth"],
    7 => [verse: "Swans-a-Swimming", cardinal: "seven", ordinal: "seventh"],
    8 => [verse: "Maids-a-Milking", cardinal: "eight", ordinal: "eighth"],
    9 => [verse: "Ladies Dancing", cardinal: "nine", ordinal: "ninth"],
    10 => [verse: "Lords-a-Leaping", cardinal: "ten", ordinal: "tenth"],
    11 => [verse: "Pipers Piping", cardinal: "eleven", ordinal: "eleventh"],
    12 => [verse: "Drummers Drumming", cardinal: "twelve", ordinal: "twelfth"]
  }

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    starting_verse = number

    opening_phrase =
      "On the #{@table[number][:ordinal]} day of Christmas my true love gave to me:"

    Enum.reduce(number..1, opening_phrase, fn number, acc ->
      [verse: verse, cardinal: cardinal, ordinal: _ordinal] = @table[number]

      acc <>
        space_or_and(starting_verse, number) <> "#{cardinal} #{verse}" <> period_or_comma(number)
    end)
  end

  @spec space_or_and(starting_verse :: integer, number :: integer) :: String.t()
  def space_or_and(starting_verse, number) do
    cond do
      starting_verse == 1 and number == 1 -> " "
      number == 1 -> "and "
      number == starting_verse -> " "
      true -> ""
    end
  end

  @spec period_or_comma(number :: integer) :: String.t()
  def period_or_comma(number) do
    if number == 1, do: ".", else: ", "
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.map(starting_verse..ending_verse, fn number ->
      add_breakline(starting_verse, number) <> verse(number)
    end)
    |> Enum.join("")
  end

  @spec add_breakline(starting_verse :: integer, number :: integer) :: String.t()
  def add_breakline(starting_verse, number) do
    if number == starting_verse, do: "", else: "\n"
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
