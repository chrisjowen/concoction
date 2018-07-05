Code.require_file("#{__DIR__}/phoenix_helper.exs")

ESpec.configure fn(config) ->
  config.before fn(_tags) ->
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Concoction.Repo)
  end

  config.finally fn(_shared) ->
    Ecto.Adapters.SQL.Sandbox.checkin(Concoction.Repo, [])
  end
end