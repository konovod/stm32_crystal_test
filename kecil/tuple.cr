struct Tuple
  def size
    {{T.size}}
  end

  def at(index : Int)
    index += size if index < 0
    {% for i in 0...T.size %}
      return self[{{i}}] if {{i}} == index
    {% end %}
    raise "Error"
  end

  def [](index : Int)
    at(index)
  end

  def map(& : Union(*T) ->)
    {% begin %}
      Tuple.new(
        {% for i in 0...T.size %}
          (yield self[{{i}}]),
        {% end %}
      )
   {% end %}
  end

  def self.new(*args : *T)
    {% if @type.name(generic_args: false) == "Tuple" %}
      # deduced type vars
      args
    {% elsif @type.name(generic_args: false) == "Tuple()" %}
      # special case: empty tuple
      # TODO: check against `Tuple()` directly after 1.4.0
      args
    {% else %}
      # explicitly provided type vars
      {% begin %}
        {
          {% for i in 0...@type.size %}
            args[{{ i }}].as(typeof(element_type({{ i }}))),
          {% end %}
        }
      {% end %}
    {% end %}
  end

  def each(& : Union(*T) ->) : Nil
    {% for i in 0...T.size %}
      yield self[{{i}}]
    {% end %}
  end

  private macro element_type(index)
    x = uninitialized self
    x[{{ index }}]
  end
end
