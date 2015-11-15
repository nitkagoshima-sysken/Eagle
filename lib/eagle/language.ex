defmodule Eagle.Language do

  defmacro __using__(_opts) do
    quote do
      import Eagle.Language
    end
  end

  defmacro language(name, display, clauses) do
    build_language(name, display, clauses)
  end

  defp build_language(name, display, do: execute) do
    build_language(name, display, do: execute, compile: nil)
  end

  defp build_language(name, display, do: execute, compile: compile) do
    quote do
      Eagle.Server.Languages.add(unquote(name), %{display: unquote(display), compile: unquote(compile), execute: unquote(execute)})
    end
  end

end
