defmodule Mcup do
  defmacro __using__(_) do
    quote do
      import Mcup.Syntax
    end
  end
end
