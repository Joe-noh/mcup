defmodule Mcup.HtmlRenderer do
  def render(article) do
    render(article, 2)
  end

  defp render([{:par, content} | rest], n) do
    "<p>#{render content, n}</p>\n#{render rest, n}"
  end

  defp render([{:cite, content} | rest], n) do
    "<blockquote>\n#{render content, n}\n</blockquote>\n#{render rest, n}"
  end

  defp render([{:item, content} | rest], n) do
    "<li>#{render content, n}</li>\n#{render rest, n}"
  end

  defp render([{:table, content} | rest], n) do
    "<table>\n#{render content, n}\n</table>\n#{render rest, n}"
  end

  defp render([{:section, section_title, content} | rest], n) do
    "<h#{n}>#{section_title}</h#{n}>\n<div>\n#{render content, n+1}\n</div>\n#{render rest, n}"
  end

  defp render([{:code, lang, content} | rest], n) do
    "<pre class='#{lang}'><code>\n#{render content, n}\n</code></pre>\n#{render rest, n}"
  end

  defp render([{:bullet, content} | rest], n) do
    "<ul>\n#{render content, n}\n</ul>\n#{render rest, n}"
  end

  defp render([{:numbered, content} | rest], n) do
    "<ol>\n#{render content, n}\n</ol>\n#{render rest, n}"
  end

  defp render([{:header, content} | rest], n) do
    ths = List.foldl content, "", fn (th, acc) -> acc <> "<th>#{th}</th>" end
    "<tr>#{ths}</tr>\n#{render rest, n}"
  end

  defp render([{:row, content} | rest], n) do
    tds = List.foldl content, "", fn (td, acc) -> acc <> "<td>#{td}</td>" end
    "<tr>#{tds}</tr>\n#{render rest, n}"
  end

  defp render([],   _), do: ""
  defp render(list, _) do
    list |> escape([]) |> Enum.join("\n")
  end

  defp escape([head | tail], acc) do
    escaped = head
      |> String.replace("&",  "&amp;")
      |> String.replace(">",  "&gt;")
      |> String.replace("<",  "&lt;")
      |> String.replace("\"", "&quot:")
    escape(tail, [escaped | acc])
  end

  defp escape([], acc), do: Enum.reverse(acc)
end
