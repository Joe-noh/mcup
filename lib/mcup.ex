defmodule Mcup do
  defmacro __using__(_) do
    quote do
      require Mcup
      import Mcup.Syntax
    end
  end

  defmacro render(article, opts \\ []) do
    renderer_mod = opts[:renderer] || Mcup.HtmlRenderer

    quote do
      unquote(renderer_mod).render(unquote article)
    end
  end
end
