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
- `minify:elm`
- `build`
- `start`

You can customize those scripts.


## npm start

Run `clean` and `watch` sequentially.

```
"start": "npm-run-all -s clean watch"
```

### clean

Remove `dist` directory.

```
"clean": "rimraf dist"
```

### watch

Run every `watch:*` at the same time.

```
"watch:elm": "elm-live src/Main.elm --open -- --debug --output=dist/elm.js",
"watch": "npm-run-all -p watch:*",
```


## npm run build

Run `clean`, `compile` and `minify:elm` sequentially.

```
"build": "npm-run-all -s clean compile minify:elm"
```

### compile

Run every `compile:*` at the same time.

```
"compile:elm": "elm make src/Main.elm --optimize --output=dist/elm.optimized.js",
"compile": "npm-run-all -p compile:*",
```

### minify:elm

Minify elm.optimized.js to elm.js

```
"minify:elm": "google-closure-compiler --js=dist/elm.optimized.js --js_output_file=dist/elm.js",
"postminify:elm": "rimraf dist/elm.optimized.js",
```
