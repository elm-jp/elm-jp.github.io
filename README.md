# elm-jp.github.io


## Installation

```
$ git clone https://github.com/elm-jp/elm-jp.github.io.git
$ cd elm-jp.github.io
$ npm install
$ npm start
```


## npm scripts

package.json has some scripts:

- `clean`
- `watch`
- `compile`
- `minify`
- `build`
- `start`

You can customize those scripts.


## npm start

Run `clean` and `watch` sequentially.

```
"start": "npm-run-all -s clean watch"
```

### clean

Remove `elm.js`.

```
"clean": "rimraf dist/elm.js"
```

### watch

Run `elm-live`.

```
"watch": "elm-live src/Main.elm --open -- --debug --output=dist/elm.js",
```


## npm run build

Run `clean`, `compile` and `minify` sequentially.

```
"build": "npm-run-all -s clean compile minify"
```

### compile

Run `elm make`.

```
"compile": "elm make src/Main.elm --optimize --output=dist/elm.optimized.js",
```

### minify

Minify elm.optimized.js to elm.js

```
"minify": "google-closure-compiler --js=dist/elm.optimized.js --js_output_file=dist/elm.js",
"postminify": "rimraf dist/elm.optimized.js",
```
