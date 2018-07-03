defmodule Integration.Concoction.Schema.DynamicSchemaSpec do
    use ESpec

    alias Concoction.Schema.DynamicSchema
    alias Concoction.Schema.UserSchema
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


    it "will create save a schema" do
      blueprint = %{
        fields: [
          %{
            name: :text_field,
            type: :string
          }
        ]
      }
      
      some_schema_module = DynamicSchema.schema(Test, blueprint)

      cs = some_schema_module.changeset(%{text_field: "apple"})
      Repo.insert!(cs)
    end
    
  end