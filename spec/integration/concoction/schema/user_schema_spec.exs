defmodule Concoction.UserSchemaSpec do
    use ESpec

    alias Concoction.UserSchema
    alias Concoction.Repo

    it "can save user" do
      user = Repo.insert!(%UserSchema{username: "Some username"})
      expect(user) |> to_not(be(nil))
    end
  end