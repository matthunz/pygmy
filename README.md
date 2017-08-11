# Pygmy
A simple URL shortener based on Elixir and Sqlite3

### Installation
```bash
git clone https://github.com/matthunz/pygmy
cd pygmy
mix deps.get
mix ecto.migrate
mix run --no-halt
```

### Usage
By default the server runs on port 4000 (this can be changed in libs/pygmy.ex)

```bash
curl -w "\n" -X POST -d 'example.com' localhost:4000
```
