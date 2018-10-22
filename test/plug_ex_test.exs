defmodule PlugExTest do
  use ExUnit.Case
  doctest PlugEx

  test "greets the world" do
    assert PlugEx.hello() == :worlda
  end
end
