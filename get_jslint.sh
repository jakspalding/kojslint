#!/bin/bash
if [ ! -f kojslint.js ]; then
	echo "Please run this script under chrome/content"
	exit 1
fi

JSLINT_URL='http://www.jslint.com/jslint.js'
JSLINT_URL_SRC='https://github.com/douglascrockford/JSLint/raw/master/fulljslint.js'
#wget --no-check-certificate https://github.com/douglascrockford/JSLint/raw/master/fulljslint.js
wget -q $JSLINT_URL -O fulljslint.js
echo '/*
Copyright (c) 2002 Douglas Crockford (www.JSLint.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

The Software shall be used for Good, not Evil.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
"use strict";
if (typeof(window.extensions) === "undefined") {
    window.extensions = {};
}' > jslint.js
cat fulljslint.js | sed -e 's/"use strict";//;s/\r//g;s/^\/\/.*//;' >> jslint.js
rm -f fulljslint.js
echo "window.extensions.JSLINT=JSLINT;" >> jslint.js

echo "successfully downloaded jslint"