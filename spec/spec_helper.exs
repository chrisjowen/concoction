Ecto.Adapters.SQL.Sandbox.mode(Concoction.Repo, {:shared, self()})

ESpec.configure fn(config) ->
  config.before fn(tags) ->
    {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    :ok
  end
end
