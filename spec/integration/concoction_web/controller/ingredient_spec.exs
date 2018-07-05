defmodule ConcoctionWeb.IngredientControllerSpec do
    use ESpec.Phoenix, controller: ConcoctionWeb.IngredientController
    import Concoction.Factory

    context "#index" do
        let :jira_ingredient, do: insert(:ingredient)

        it "will create a schema" do
            conn = build_conn()
            IO.inspect(jira_ingredient())
            path = ingredient_path(conn, :index)    
            conn |> get(path) |> json_response(200) |> IO.inspect
        end
    end
end
  