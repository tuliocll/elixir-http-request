# HttpRequest

<div align="center">

![](https://elixir-lang.org/images/logo/logo.png)


</div>

**A simple "application" to make requests n times for a url**
**this is a study project with elixir and i used it to do a simple stress test on my server/database**

## Usage

You can execute the Iex and call the module and the function
```bash
iex -S mix
```
```bash
iex(1)>HttpRequest.execute(5, 'https://www.google.com')
```
This will make five request for 'www.google.com'.
You can pass a token too:
```bash
iex(1)>HttpRequest.execute(5, 'https://www.google.com', 'Bearer 123123123')
```
And you can check the doc running:
```bash
iex(1)> h(HttpRequest.execute)
```

Made with ❤ in Bahia, Brasil.
