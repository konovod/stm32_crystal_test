struct StaticArray(T, N)
  def to_unsafe : Pointer(T)
    pointerof(@buffer)
  end

  macro [](*args)
    %array = uninitialized StaticArray(typeof({{args.splat}}), {{args.size}})
    {% for arg, i in args %}
      (%array.to_unsafe+{{i}}).store({{arg}})
    {% end %}
    %array
  end

  @[AlwaysInline]
  def [](index : Int) : T
    (to_unsafe + index).load
  end
  
  def each(& : T ->) : Nil
    {% for i in 0...N %}
      yield self[{{i}}]
    {% end %}
  end   
end
