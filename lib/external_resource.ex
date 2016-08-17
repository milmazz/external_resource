defmodule ExternalResource do
  @moduledoc false

  @external_resource path = Application.app_dir(:external_resource, "priv/media-types.txt")

  path 
  |> File.stream!()
  |> Enum.each(fn(line) ->
    [extension, media] = line |> String.trim() |> String.split(",")

    def media_type("." <> unquote(extension)) do
      unquote(media)
    end
  end)

  def media_type(_), do: nil
end
