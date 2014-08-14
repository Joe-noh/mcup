# Mcup

Markup with Elixir. You underestimate the power of the Elixir Macro.

* Why?
  * For fun.
  * An example of usage of Macro.
* We already have markdown.
  * Diversity is nice!
  * Diversity is nice!
  * Diversity is nice!

## Usage

```elixir
use Mcup

article = 
  begin do
    section "Section 1" do
      code "elixir" do
        "iex> 1+1"
        "2"
      end
      par do
        "Lorem ipsum"
      end
      list :bullet do
        item "one"
        item "two"
      end
    end
    section "Section 2" do
      table do
        th ["one", "two", "three"]
        td [    1,     2,       3]
        td [    1,     2,       3]
      end
    end
  end

Mcup.render(article) # =>

"""
<h2>Section 1</h2>
<div>
<pre class='elixir'><code>
iex&gt; 1+1
2
</code></pre>
<p>Lorem ipsum</p>
<ul>
<li>one</li>
<li>two</li>

</ul>

</div>
<h2>Section 2</h2>
<div>
<table>
<tr><th>one</th><th>two</th><th>three</th></tr>
<tr><td>1</td><td>2</td><td>3</td></tr>
<tr><td>1</td><td>2</td><td>3</td></tr>

</table>

</div>
"""
```
