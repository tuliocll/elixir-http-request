defmodule HttpRequestTest do
  use ExUnit.Case
  doctest HttpRequest

  test "greets the world" do
    assert HttpRequest.hello() == :world
  end
end
