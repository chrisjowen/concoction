defmodule Concoction.Trigger.PipelineSpec do
    use ESpec
    alias Concoction.Pipeline
    alias Concoction.Pipeline.Context

    let :context, do: %Context{}

    defp error_processor(_), do: :error
    defp passthrough_processor(context), do: context
    defp increment_processor(context) do
      val = Context.assigns(context, :inc)
      Context.assigns(context, :inc, val + 1)
    end

    it "Should proceed to next step " do
        context = context()
        Pipeline.step(&passthrough_processor/1)
          |> Pipeline.step(&passthrough_processor/1)
          |> Pipeline.execute(context)
          |> should(be(context))
    end

    it "Should proceed to next step and increment" do
      context = Context.assigns(context(), :inc, 0)
      Pipeline.step(&increment_processor/1)
          |> Pipeline.step(&passthrough_processor/1)
          |> Pipeline.execute(context)
          |> Context.assigns(:inc)
          |> should(be(1))

    end

    it "Should proceed to next step and increment twice" do
      context = Context.assigns(context(), :inc, 0)
      Pipeline.step(&increment_processor/1)
          |> Pipeline.step(&increment_processor/1)
          |> Pipeline.execute(context)
          |> Context.assigns(:inc)
          |> should(be(2))
    end

    it "Should proceed to next step and increment in reverse order" do
      context = Context.assigns(context(), :inc, 0)
      Pipeline.step(&passthrough_processor/1)
          |> Pipeline.step(&increment_processor/1)
          |> Pipeline.execute(context)
          |> Context.assigns(:inc)
          |> should(be(1))
    end

    it "Should not proceed to next step if no context found" do
      context = Context.assigns(context(), :inc, 0)
      Pipeline.step(&error_processor/1)
          |> Pipeline.step(&increment_processor/1)
          |> Pipeline.execute(context)
          |> should(be(:error))
    end

  end

