defmodule HtmlRendererTest do
  use ExUnit.Case

  alias Mcup.HtmlRenderer

  test "par" do
    rendered = render_partial {:par, ["one", "two"]}
    expected = "<p>one\ntwo</p>\n"

    assert rendered == expected
  end

  test "cite" do
    rendered = render_partial {:cite, ["one", "two"]}
    expected = "<blockquote>one\ntwo</blockquote>\n"

    assert rendered == expected
  end

  test "item" do
    rendered = render_partial {:item, ["one", "two"]}
    expected = "<li>one\ntwo</li>\n"

    assert rendered == expected
  end

  test "table" do
    rendered = render_partial {:table, ["one", "two"]}
    expected = "<table>one\ntwo</table>\n"

    assert rendered == expected
  end

  test "section" do
    rendered = render_partial {:section, "Section 1", ["one", "two"]}
    expected = "<h3>Section 1</h3><div>one\ntwo</div>\n"

    assert rendered == expected
  end

  test "code" do
    rendered = render_partial {:code, "elixir", ["one", "two"]}
    expected = "<pre class='elixir'><code>one\ntwo</code></pre>\n"

    assert rendered == expected
  end

  test "list" do
    rendered = render_partial {:bullet, ["one", "two"]}
    expected = "<ul>one\ntwo</ul>\n"

    assert rendered == expected

    rendered = render_partial {:numbered, ["one", "two"]}
    expected = "<ol>one\ntwo</ol>\n"

    assert rendered == expected
  end

  test "header" do
    rendered = render_partial {:header, ["one", "two"]}
    expected = "<tr><th>one</th><th>two</th></tr>\n"

    assert rendered == expected
  end

  test "row" do
    rendered = render_partial {:row, ["one", "two"]}
    expected = "<tr><td>one</td><td>two</td></tr>\n"

    assert rendered == expected
  end

  defp render_partial(content) do
    HtmlRenderer.render([title: "", date: "", author: "", body: [content]])
    |> String.replace(~r"\A.+?<div>"sm, "")
    |> String.replace(~r"</div>\z", "")
  end
end
