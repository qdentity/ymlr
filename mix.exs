defmodule Ymlr.MixProject do
	use Mix.Project

	def project do
		[
			app: :ymlr,
			description: "A YAML Encoder",
			version: "0.1.0",
			elixir: "~> 1.10",
			deps: deps(),
			dialyzer: dialyzer(),
			preferred_cli_env: cli_env(),
			test_coverage: [tool: ExCoveralls],
			test_paths: ["lib"],

		]
	end

	def application do
		[
			extra_applications: [:logger]
		]
	end

	defp cli_env do
		[
			coveralls: :test,
			"coveralls.detail": :test,
			"coveralls.post": :test,
			"coveralls.html": :test,
			"coveralls.travis": :test
		]
	end

	defp deps do
		[
			{:credo, "~> 1.4", only: [:dev, :test], runtime: false},
			{:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
			{:excoveralls, "~> 0.12", only: [:test]},
			{:ex_doc, "~> 0.20", only: :dev},
			{:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
			{:yaml_elixir, "~> 2.4", only: [:test]},
		]
	end

	defp dialyzer do
		[
			ignore_warnings: ".dialyzer_ignore.exs",
			plt_add_apps: [:mix, :eex],
			plt_core_path: "priv/plts",
			plt_file: {:no_warn, "priv/plts/k8s.plt"}
		]
	end
end