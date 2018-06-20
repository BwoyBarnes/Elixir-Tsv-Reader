defmodule Settings do
  import EnvHelper
  system_env(:port, 80, :string_to_integer)
end
