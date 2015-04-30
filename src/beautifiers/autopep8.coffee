###
Requires https://github.com/hhatto/autopep8
###

"use strict"
Beautifier = require('./beautifier')

module.exports = class autopep8 extends Beautifier

    options: {
        Python: true
    }

    beautify: (text, language, options) ->
        @run("autopep8", [
                @tempFile("input", text)
                "--max-line-length #{options.max_line_length}" if options.max_line_length?
                "--indent-size #{options.indent_size}" if options.indent_size?
                "--ignore #{options.ignore.join(',')}" if options.ignore?
            ])
