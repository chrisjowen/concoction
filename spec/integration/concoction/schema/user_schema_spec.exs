defmodule Integration.Concoction.Schema.UserSpec do
    use ESpec

    alias Concoction.Schema.UserSchema
    alias Concoction.Repo

    it "can save user" do
      user = Repo.insert!(%UserSchema{username: "Some username"})
      expect(user) |> to_not(be(nil))
    end
  end