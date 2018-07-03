defmodule Concoction.Schema.DynamicSchema do




    def schema(name, %{fields: fields} = blueprint) when is_atom(name) do

        quoted_fields =  Enum.map(fields, &make_field/1)
        keys = fields |> Enum.map(&keys/1)

        Module.create(name, quote do
            import Ecto.Changeset
            use Ecto.Schema
 
            schema "tests" do
                unquote(quoted_fields)
            end
 
            def changeset(params \\ %{}) do
               cast(%unquote(name){}, params,  unquote(keys)) 
            end
 
        end, Macro.Env.location(__ENV__))
        name
    end

    defp make_field(%{name: name, type: :string}) do
        name_atom = name
        quote do
            field unquote(name_atom), :string
        end
    end

    defp keys(%{name: name}), do: name
end
