_ = require('lodash')
dom = require('../../lib/dom')


class BaseTheme
  @OPTIONS: {}

  @objToCss: (obj) ->
    return _.map(obj, (value, key) ->
      innerStr = _.map(value, (innerValue, innerKey) ->
        return "#{innerKey}: #{innerValue};"
      ).join(' ')
      return "#{key} { #{innerStr} }"
    ).join("\n")

  constructor: (@quill, @options) ->
    dom(@quill.root.parentNode).addClass('ql-container')
    this.addStyles(@options.styles) if @options.styles

  addStyles: (css) ->
    css = BaseTheme.objToCss(css) if _.isObject(css)
    style = document.createElement('style')
    style.type = 'text/css'
    style.appendChild(document.createTextNode(css))
    document.head.appendChild(style)


module.exports = BaseTheme
