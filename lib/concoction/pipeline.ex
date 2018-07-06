defmodule Concoction.Pipeline.Context do
    alias Concoction.Pipeline.Context
    defstruct [
        fetcher: nil,
        response: nil,
        meta: [],
        assigns: %{}
    ]

    def assigns(context = %Context{}, key), do: Map.get(context.assigns, key)
    def assigns(context = %Context{}, key, value), do: put_in(context.assigns[key], value)
end

defmodule Concoction.Pipeline do
    defstruct name: nil, steps: []

    alias Concoction.Pipeline
    alias Concoction.Pipeline.{Context}

    def execute(definition, context),  do: next(context, definition.steps)

    def step(step) when is_function(step, 1), do: step(%Pipeline{}, step)
    def step(pipeline, step) when is_function(step, 1) and is_map(pipeline) do
        Map.merge(pipeline, %Pipeline{
            steps: pipeline.steps ++ [step]
        })
    end

    defp next(context, []), do: context
    defp next(context = %Context{}, [fun|t]) when is_function(fun, 1), do: next(fun.(context), t)
    defp next(other, _), do: other
end
