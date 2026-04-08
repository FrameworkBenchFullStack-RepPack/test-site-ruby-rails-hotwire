# Test Site: Ruby on Rails + Hotwire

Requires:

- Ruby with Rails installed: https://guides.rubyonrails.org/install_ruby_on_rails.html
- A running copy of the database: https://github.com/FrameworkBenchFullStack-RepPack/database-seed

## Build and run:

Do this when you need to run the server for benchmarking purposes.

Install dependencies:

```sh
bundle install --gemfile Gemfile
```

Compile static assets:

```sh
DATABASE_URL=postgresql://USER:PASS@localhost:PORT/benchmark RAILS_ENV=production bin/rails assets:precompile
```

Yes, the precompile step requires a working connection to the database (:

Run server:

```sh
DATABASE_URL=postgresql://USER:PASS@localhost:PORT/benchmark HTTP_PORT=4000 RAILS_ENV=production bin/thrust bin/rails server
```

This opens an internal cross-process communication port which defaults to port `3000`. If you need to change it, you can do so by adding `TARGET_PORT=3001` to the beginning of the above command. It is important that you do not connect directly to `TARGET_PORT`, but connect to the external `HTTP_PORT` instead.

While starting up, the server will log:
```sh
{"time":"2026-04-06T15:55:11.260039689+02:00","level":"INFO","msg":"Server started","http":":3002"}
```

Which contains the correct port for you to listen on. When server is ready, it logs:

```sh
Listening on http://0.0.0.0:3000
```

Which means that you can now start to send requests to the server, but you should still use the originally logged port. The port that is shown in the last log message is not the correct one!

## Run test-server for development:

Do this if you need a quick preview of the website, or are actively working on it.

Install dependencies:

```sh
bundle install --gemfile Gemfile
```

Add a `.env` file that points to the database:

```
DATABASE_URL=postgresql://benchmark:benchmark@localhost:5432/benchmark
```

Run the development server:

```sh
bin/rails server
```
