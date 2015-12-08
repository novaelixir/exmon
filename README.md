# Exmon

Exmon is some sample code that was live coded at the December 2015 NoVA Elixir meetup.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add exmon to your list of dependencies in `mix.exs`:

        def deps do
          [{:exmon, "~> 0.0.1"}]
        end

  2. Ensure exmon is started before your application:

        def application do
          [applications: [:exmon]]
        end
