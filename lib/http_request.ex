defmodule HttpRequest do
  @moduledoc """
  Documentation for `HttpRequest`.
  A simple script to make many request to a url.
  """
  @moduledoc since: "1.0.0"

  def execute(n, url)
      when n == 0 do
    IO.puts("Finalizado requisições para #{url}")
  end

  @doc """
  Execute N request for specific url

  ## Example

      iex> HttpRequest.make_requests(5, 'www.google.com')
      Req N5 | Cod: 200 | status: OK
      Req N4 | Cod: 200 | status: OK
      Req N3 | Cod: 200 | status: OK
      Req N2 | Cod: 200 | status: OK
      Req N1 | Cod: 200 | status: OK
      Finalizado requisições para www.google.com
  """
  def execute(n, url) do
    result = make_request(url, '')

    {status, _, _} = result

    {_, code, msg} = status

    if msg == 'Unauthorized' do
      IO.puts('Unauthorized')
      :error
    else
      IO.puts("Req N#{n} | Cod: #{code} | status: #{msg}")
      execute(n - 1, url)
    end
  end

  @doc """
  Execute N request for specific url with authorization token

  ## Example

      iex> HttpRequest.make_requests(5, 'www.google.com', 'Bearer 123123123123')
      Req N5 | Cod: 200 | status: OK
      Req N4 | Cod: 200 | status: OK
      Req N3 | Cod: 200 | status: OK
      Req N2 | Cod: 200 | status: OK
      Req N1 | Cod: 200 | status: OK
      Finalizado requisições para www.google.com
  """
  def execute(n, url, token) do
    result = make_request(url, token)

    {status, _, _} = result

    {_, code, msg} = status

    if msg == 'Unauthorized' do
      IO.puts('Unauthorized')
      :error
    else
      IO.puts("Req N#{n} | Cod: #{code} | status: #{msg}")
      execute(n - 1, url, token)
    end
  end

  @doc """
  Caso não informe a url
  """
  def execute(n) do
    IO.puts("Faltando url")
  end

  @doc """
  Caso não informe a url nem quantidade de ciclos
  """
  def execute() do
    IO.puts("Faltando quantidade e url")
  end

  def make_request(url, token) do
    Application.ensure_all_started(:inets)

    Application.ensure_all_started(:ssl)

    if token do
      {:ok, result} =
        :httpc.request(
          :get,
          {url,
           [
             {'Authorization', token}
           ]},
          [],
          []
        )

      result
    else
      {:ok, result} =
        :httpc.request(
          :get,
          {url, []},
          [],
          []
        )

      result
    end
  end
end
