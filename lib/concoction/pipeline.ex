defmodule Concoction.Pipeline.Definition do
    defstruct steps: []
end

defmodule Concoction.Pipeline.Context do 
    alias Concoction.Pipeline.Context
    defstruct [
        fetcher: nil, 
        response: nil, 
        meta: [],
        assigns: %{}
    ]

    def assigns(context = %Context{}, key), do: Map.get(context.assigns, key)
    def assigns(context = %Context{}, key, value) do
        assigns = Map.put(context.assigns, key, value)
        Map.put(context, :assigns, assigns)
    end
end

defmodule Concoction.Pipeline do
    alias Concoction.Pipeline.{Definition, Context}
    
    def step(pipeline) when is_function(pipeline, 1), do: step(%Definition{}, pipeline)
    def step(definition, pipeline) when is_function(pipeline, 1) and is_map(definition) do 
        Map.merge(definition, %Definition{
            steps: definition.steps ++ [pipeline]
        })   
    end

    def execute(definition, context),  do: next(context, definition.steps)
    defp next(context, []), do: context
    defp next(context = %Context{}, [h|t]) when is_function(h, 1), do: next(h.(context), t)
    defp next(other, _), do: other
end
