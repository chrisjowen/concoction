defmodule Concoction.DynamicSchemaSpec do
    use ESpec
    alias Concoction.DynamicSchema
    alias Concoction.Repo

    it "will create a schema" do
      blueprint = %{
        fields: [
          %{
            name: :text_field,
            type: :string
          }
        ]
      }
      some_schema_module = DynamicSchema.schema(:foo, blueprint)
      expect(some_schema_module.__schema__(:fields)) |> to(be([:id, :text_field]))
    end
  end